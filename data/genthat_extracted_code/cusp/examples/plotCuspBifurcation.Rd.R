library(cusp)


### Name: plotCuspBifurcation
### Title: Display Fitted Data on Control Plane of Cusp Catastrophe.
### Aliases: plotCuspBifurcation
### Keywords: hplot

### ** Examples

set.seed(20)
# example with regressors
x1 = runif(150)
x2 = runif(150)
z = Vectorize(rcusp)(1, 4*x1-2, 4*x2-1)
data <- data.frame(x1, x2, z)
fit <- cusp(y ~ z, alpha ~ x1+x2, beta ~ x1+x2, data)
## Not run: 
##D plot(fit, what='bifurcation', box=TRUE, axes=FALSE)
## End(Not run)



