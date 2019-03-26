library(deldir)


### Name: divchain.deldir
### Title: Dividing chain; "deldir" method.
### Aliases: divchain.deldir
### Keywords: spatial

### ** Examples

   set.seed(42)
   x   <- runif(50)
   y   <- runif(50)
   z   <- factor(kmeans(cbind(x,y),centers=4)$cluster)
   dxy <- deldir(x,y,z=z,rw=c(0,1,0,1))
   dc  <- divchain(dxy)



