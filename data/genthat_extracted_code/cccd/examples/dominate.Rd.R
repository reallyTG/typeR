library(cccd)


### Name: dominate
### Title: Dominating Sets
### Aliases: dominate
### Keywords: graphs

### ** Examples


x <- matrix(runif(100),ncol=2)
y <- matrix(runif(100,-2,2),ncol=2)
G <- cccd(x,y)
D <- dominate(G)
## Not run: 
##D plot(G,balls=TRUE,D=D)
## End(Not run)




