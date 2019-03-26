library(GHQp)


### Name: GHQ
### Title: Gaussian Hermite Quadrature with prunning
### Aliases: GHQ
### Keywords: optimize

### ** Examples

# Comparing the number of points in a two-dimensional case
require(GHQp)
par(mfrow=c(2,2))
plot(GHQ(15,2,FALSE)$nodes,pch=20,xlab='',ylab='',
     main='Without pruning, n=15 and q=2')
plot(GHQ(15,2,TRUE)$nodes, pch=20,xlab='',ylab='',
     main='With pruning, n=15 and q=2')

# Comparing the number of points in a three-dimensional case
require(scatterplot3d)
datos <- GHQ(15,3,FALSE)$nodes
scatterplot3d(datos, type="p", highlight.3d=TRUE,
              angle=55, scale.y=0.7, pch=16,
              main='Without pruning, n=15 and q=3', 
              cex.symbols=0.4,xlab='',ylab='',zlab='')
datos <- GHQ(15,3,TRUE)$nodes
scatterplot3d(datos, type="p", highlight.3d=TRUE,
              angle=55, scale.y=0.7, pch=16,
              main='With pruning, n=15 and q=3', 
              cex.symbols=0.4,xlab='',ylab='',zlab='')



