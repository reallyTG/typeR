library(deldir)


### Name: plot.divchain
### Title: Plot a dividing chain.
### Aliases: plot.divchain
### Keywords: spatial

### ** Examples

   set.seed(42)
   x   <- runif(50)
   y   <- runif(50)
   z   <- factor(kmeans(cbind(x,y),centers=4)$cluster)
   dc  <- divchain(x,y,z,rw=c(0,1,0,1))
   plot(dc,lwd=2,col="blue",bty="o")



