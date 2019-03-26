library(deldir)


### Name: divchain.default
### Title: Dividing chain; default method.
### Aliases: divchain.default
### Keywords: spatial

### ** Examples

   set.seed(42)
   x    <- runif(50)
   y    <- runif(50)
   z    <- factor(kmeans(cbind(x,y),centers=4)$cluster)
   dcxy <- divchain(x,y,z,rw=c(0,1,0,1))



