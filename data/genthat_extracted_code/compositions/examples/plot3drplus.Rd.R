library(compositions)


### Name: plot3Drplus
### Title: plot in 3D based on rgl
### Aliases: plot3D.rplus
### Keywords: multivariate

### ** Examples

x <- cbind(rnorm(10),rnorm(10),rnorm(10))
plot3D(rplus(exp(x)))
data(SimulatedAmounts)
plot3D(rplus(sa.lognormals),cex=4,col=1:nrow(sa.lognormals))



