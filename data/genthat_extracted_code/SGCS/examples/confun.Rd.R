library(SGCS)


### Name: confun
### Title: Connectivity function and cumulative connectivity function.
### Aliases: confun

### ** Examples

## Not run: 
##D x <- rMatClust(10, 0.1, 10)
##D plot(Cx<-confun(x,h=0, R=0.1))
##D 
##D # fit wrong model
##D ftho <- thomas.estpcf(x)
##D yf <- function()rThomas(ftho$par[1], ftho$par[2], x$n/ftho$par[1])
##D CC <- envelope(x, fun=confun, h=0, sim=yf, R=0.1)
##D C <- envelope(x, fun=confun, sim=yf, R=0.1)
##D 
##D plot(CC)
##D plot(C)
## End(Not run)




