library(cusp)


### Name: cusp3d
### Title: Generate 3D plot of Cusp Catatrophe Model Fit
### Aliases: cusp3d
### Keywords: hplot models

### ** Examples

set.seed(123)
x1 = runif(150)
x2 = runif(150)
z = Vectorize(rcusp)(1, 4*x1-2, 4*x2-1)
data <- data.frame(x1, x2, z)
fit <- cusp(y ~ z, alpha ~ x1+x2, beta ~ x1+x2, data)
## Not run: 
##D cusp3d(fit)
## End(Not run)



