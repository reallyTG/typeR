library(fpc)


### Name: classifdist
### Title: Classification of unclustered points
### Aliases: classifdist classifnp
### Keywords: cluster multivariate

### ** Examples
  
set.seed(20000)
x1 <- rnorm(50)
y <- rnorm(100)
x2 <- rnorm(40,mean=20)
x3 <- rnorm(10,mean=25,sd=100)
x <- cbind(c(x1,x2,x3),y)
truec <- c(rep(1,50),rep(2,40),rep(3,10))
topredict <- c(1,2,51,52,91)
clumin <- truec
clumin[topredict] <- -1

classifnp(x,clumin, method="averagedist")
classifnp(x,clumin, method="qda")
classifdist(dist(x),clumin, centroids=c(3,53,93),method="centroid")
classifdist(dist(x),clumin,method="knn")




