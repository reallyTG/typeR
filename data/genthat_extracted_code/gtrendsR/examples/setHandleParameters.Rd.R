library(gtrendsR)


### Name: setHandleParameters
### Title: If 'gtrends' should be used behind a proxy, especially with NTLM
###   authentication mode, you need to set the proxy parameters and
###   credentials using "setHandleParameters" function
### Aliases: setHandleParameters

### ** Examples


## Not run: 
##D library(gtrendsR)
##D 
##D setHandleParameters(user="xxxx",password="*******",domain="mydomain",proxyhost = "10.111.124.113")
##D res <- gtrends(c("nhl", "nba"), geo = c("CA", "US"))
## End(Not run)



