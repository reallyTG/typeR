library(etseed)


### Name: etcd
### Title: etseed client
### Aliases: etcd

### ** Examples

## Not run: 
##D # make a client
##D cli <- etcd()
##D 
##D # ping
##D ## ping to make sure it's up
##D cli$ping()
##D 
##D # version
##D ## get etcd version information
##D cli$version()
##D 
##D # etcd variables
##D cli$host
##D cli$port
##D cli$api_version
##D cli$allow_redirect
##D cli$scheme
##D 
##D # set a different host
##D etcd(host = 'stuff.com')
##D 
##D # set a different port
##D etcd(host = 3456)
##D 
##D # set a different etcd API version
##D etcd(host = 'v3')
##D 
##D # set a different http scheme
##D etcd(scheme = 'https')
##D 
##D # don't allow redirects
##D etcd(allow_redirect = FALSE)
## End(Not run)



