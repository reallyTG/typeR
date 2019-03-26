library(getProxy)


### Name: getProxy
### Title: Get ip and port by free proxy, start ans stop internet
###   connection over free proxy server.
### Aliases: getProxy

### ** Examples

## Not run: 
##D #For get IP and PORT in R object
##D prox_ip_and_port <- getProxy(port = "3128", 
##D 							 country = "RU", 
##D 							 action = "get")
##D 
##D #For get and start proxy settings 
##D prox_ip_and_port <- getProxy(port = "3128", 
##D 							 country = "RU", 
##D 							 action = "start")
##D 
##D #For stop proxy
##D getProxy(action = "stop")
## End(Not run)



