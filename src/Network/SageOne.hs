module Network.SageOne where

import Network.HTTP.Client
import Network.HTTP.Client.TLS (tlsManagerSettings)
import Network.SageOne.Config (url, username, password, apikey)

newTlsManager :: IO Manager
newTlsManager = newManager tlsManagerSettings

main :: IO ()
main = do
  http <- newTlsManager
  getCompany http

getCompany :: Manager -> IO ()
getCompany http = do
  req <- parseUrlThrow (url <> "/company/get?apikey=" <> apikey)
  resp <- httpLbs (applyBasicAuth username password req) http
  putStrLn $ show resp
