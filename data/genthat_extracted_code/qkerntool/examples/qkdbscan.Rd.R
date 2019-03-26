library(qkerntool)


### Name: qkdbscan
### Title: qKernel-DBSCAN density reachability and connectivity clustering
### Aliases: qkdbscan qkdbscan,matrix-method qkdbscan,cndkernmatrix-method
###   qkdbscan,qkernmatrix-method print,qkdbscan-method
###   predict,qkdbscan-method
### Keywords: cluster

### ** Examples

# a simple example using the iris
data(iris)
test <- sample(1:150,20)
x<- as.matrix(iris[-test,-5])
ds <- qkdbscan (x,kernel="laplbase",qpar=list(sigma=3.5,q=0.8),eps=0.15,
MinPts=5,hybrid = FALSE)
plot(ds,x)
emb <- predict(ds, x, as.matrix(iris[test,-5]))
points(iris[test,], col= as.integer(1+emb))




