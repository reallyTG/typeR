library(spatstat)


### Name: nnwhich.ppx
### Title: Nearest Neighbours in Any Dimensions
### Aliases: nnwhich.ppx
### Keywords: spatial math

### ** Examples

   df <- data.frame(x=runif(5),y=runif(5),z=runif(5),w=runif(5))
   X <- ppx(data=df)
   m <- nnwhich(X)
   m2 <- nnwhich(X, k=2)



