library(compositions)


### Name: plot3Drmult
### Title: plot in 3D based on rgl
### Aliases: plot3D.rmult
### Keywords: multivariate

### ** Examples

x <- cbind(rnorm(10),rnorm(10),rnorm(10))
plot3D(x)
data(SimulatedAmounts)
plot3D(rmult(sa.lognormals),cex=4,col=1:nrow(sa.lognormals))



