library(clifro)


### Name: cf_curl_opts
### Title: Store curl options for use within 'clifro'
### Aliases: cf_curl_opts

### ** Examples

## Not run: 
##D # Specify options for use in all the curl handles created in clifro
##D cf_curl_opts(.opts = list(proxy = "http://xxxxx.yyyy.govt.nz:8080",
##D                           proxyusername  = "uid",
##D                           proxypassword  = "pwd",
##D                           ssl.verifypeer = FALSE))
##D # Or alternatively:
##D cf_curl_opts(proxy = "http://xxxxx.yyyy.govt.nz:8080",
##D              proxyusername  = "uid",
##D              proxypassword  = "pwd",
##D              ssl.verifypeer = FALSE)
## End(Not run)



