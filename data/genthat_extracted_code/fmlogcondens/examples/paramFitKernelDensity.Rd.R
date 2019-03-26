library(fmlogcondens)


### Name: paramFitKernelDensity
### Title: Parameter Initialization Based on a Kernel Density
### Aliases: paramFitKernelDensity

### ** Examples

# draw samples from normal distribution
X <- matrix(rnorm(200),100,2) 
# calculate parameters of convex hull of X
r <- calcCvxHullFaces(X)
# find initial hyperplane parameters based on a kernel density estimator with Gaussian kernel
params <- paramFitKernelDensity(X, rep(1 / nrow(X), nrow(X)), r$cvh)



