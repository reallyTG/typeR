library(fmlogcondens)


### Name: paramFitGammaOne
### Title: Parameter Initialization Based on a Smooth Log-Concave Density
### Aliases: paramFitGammaOne

### ** Examples

# draw samples from normal distribution
X <- matrix(rnorm(200),100,2) 
# calculate parameters of convex hull of X
r <- calcCvxHullFaces(X)
# find initial hyperplane parameters based on a smooth log-concave density
params <- paramFitGammaOne(X, rep(1 / nrow(X), nrow(X)), r$ACVH, r$bCVH, r$cvh)



