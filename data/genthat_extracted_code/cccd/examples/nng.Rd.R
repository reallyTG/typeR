library(cccd)


### Name: nng
### Title: Nearest Neighbor Graphs
### Aliases: nng
### Keywords: graphs

### ** Examples


x <- matrix(runif(100),ncol=2)

G1 <- nng(x,k=1)
## Not run: 
##D par(mfrow=c(2,2))
##D plot(G1)
## End(Not run)

G2 <- nng(x,k=2)
## Not run: 
##D plot(G2)
## End(Not run)

G5 <- nng(x,k=5)
## Not run: 
##D plot(G5)
## End(Not run)

G5m <- nng(x,k=5,mutual=TRUE)
## Not run: 
##D plot(G5m)
##D par(mfrow=c(1,1))
## End(Not run)




