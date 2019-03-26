library(supc)


### Name: supc.random
### Title: Randomized Self-Updating Process Clustering
### Aliases: supc.random

### ** Examples

## Not run: 
##D # The shape data has a structure of five clusters and a number of noise data points.
##D makecircle=function(N, seed){
##D  n=0
##D  x=matrix(NA, nrow=N, ncol=2)
##D  while (n<N){
##D    tmp=runif(2, min=0, max=1)*2-1
##D    if (sum(tmp^2)<1) {
##D       n=n+1
##D       x[n,]=tmp
##D    }
##D  }
##D  return(x)
##D }
##D 
##D makedata <- function(ns, seed) {
##D  size=c(10,3,3,1,1)
##D  mu=rbind(c(-0.3, -0.3), c(-0.55, 0.8), c(0.55, 0.8), c(0.9, 0), c(0.9, -0.6))
##D  sd=rbind(c(0.7, 0.7), c(0.45, 0.2), c(0.45, 0.2), c(0.1, 0.1), c(0.1, 0.1))
##D  x=NULL
##D 
##D  for (i in 1:5){
##D     tmp=makecircle(ns*size[i], seed+i)
##D     tmp[,1]=tmp[,1]*sd[i,1]+mu[i,1]
##D     tmp[,2]=tmp[,2]*sd[i,2]+mu[i,2]
##D     x=rbind(x, tmp)
##D  }
##D  
##D  tmp=runif(floor(ns/3), min=0, max=1)/5-0.1
##D  tmp=cbind(tmp, 0.8*rep(1, floor(ns/3)))
##D  x=rbind(x, tmp)
##D  x=rbind(x, matrix(1, nrow=2*ns, ncol=2)*2-1)
##D  return(x)
##D }
##D 
##D shape1 <- makedata(5000, 1000)
##D dim(shape1)
##D plot(shape1)
##D 
##D X.supc=supc.random(shape1, r=0.5, t="dynamic", k = 500)
##D plot(shape1, col=X.supc$cluster)
## End(Not run)




