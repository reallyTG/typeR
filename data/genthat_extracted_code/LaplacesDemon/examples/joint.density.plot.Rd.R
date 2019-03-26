library(LaplacesDemon)


### Name: joint.density.plot
### Title: Joint Density Plot
### Aliases: joint.density.plot
### Keywords: Plot

### ** Examples

library(LaplacesDemon)
X <- rmvn(1000, runif(2), diag(2))
joint.density.plot(X[,1], X[,2], Title="Joint Density Plot",
     contour=TRUE, color=FALSE)
joint.density.plot(X[,1], X[,2], Title="Joint Density Plot",
     contour=FALSE, color=TRUE)
joint.density.plot(X[,1], X[,2], Title="Joint Density Plot",
     contour=TRUE, color=TRUE)
joint.density.plot(X[,1], X[,2], Title="Joint Trace Plot",
     contour=FALSE, color=TRUE, Trace=c(1,10))



