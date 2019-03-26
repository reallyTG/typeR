library(spatstat)


### Name: Replace.im
### Title: Reset Values in Subset of Image
### Aliases: [<-.im
### Keywords: spatial manip

### ** Examples

 # make up an image
 X <- setcov(unit.square())
 plot(X)

 # a rectangular subset
 W <- owin(c(0,0.5),c(0.2,0.8))
 X[W] <- 2
 plot(X)

 # a polygonal subset
 data(letterR)
 R <- affine(letterR, diag(c(1,1)/2), c(-2,-0.7))
 X[R] <- 3
 plot(X)

 # a point pattern
 P <- rpoispp(20)
 X[P] <- 10
 plot(X)

 # change pixel value at a specific location
 X[list(x=0.1,y=0.2)] <- 7

 # matrix indexing --- single vector index
 X[1:2570] <- 10
 plot(X)

 # matrix indexing using double indices
 X[1:257,1:10] <- 5
 plot(X)

 # matrix indexing using a matrix of indices
 X[cbind(1:257,1:257)] <- 10
 X[cbind(257:1,1:257)] <- 10
 plot(X)



