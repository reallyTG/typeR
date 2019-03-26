library(ClamR)


### Name: ClamR-package
### Title: Climate Change with Proxies
### Aliases: ClamR-package ClamR
### Keywords: package

### ** Examples

## Not run: 
##D data(CLAM1)
##D x = CLAM1$x
##D y = CLAM1$y
##D 
##D dx = 3.392
##D 
##D gout = proxyJK(x, y, dx)
##D 
##D plotproxy1(x, y, gout)
##D 
##D par(mfrow=c(2,1))
##D 
##D plotproxy.error(x, y, gout, type = 1)
##D plotproxy.error(x, y, gout, type = 2)
##D 
##D 
##D par(mfrow=c(2,1))
##D plotproxy.error(x, y, gout, type = 2)
##D 
##D plotproxy.all2(gout,YAXstyle=1 )
## End(Not run)




