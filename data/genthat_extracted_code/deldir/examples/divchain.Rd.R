library(deldir)


### Name: divchain
### Title: Dividing chain; generic.
### Aliases: divchain
### Keywords: spatial

### ** Examples

   set.seed(42)
   x   <- runif(50)
   y   <- runif(50)
   z   <- factor(kmeans(cbind(x,y),centers=4)$cluster)
   dc1 <- divchain(x,y,z,rw=c(0,1,0,1))
   dxy <- deldir(x,y,z=z,rw=c(0,1,0,1))
   dc2 <- divchain(dxy)



