library(mrfDepth)


### Name: bagdistance
### Title: Bagdistance of points relative to a dataset
### Aliases: bagdistance
### Keywords: multivariate

### ** Examples

# Generate some bivariate data
nObs <-500
N <- matrix(rnorm(nObs * 2), nrow = nObs, ncol = 2)
A <- matrix(c(1,1,.5,.1), ncol = 2, nrow = 2)
X <- N

# In two dimensions we may either use the approximate
# or exact algorithm to compute the bag.
respons.exact <- bagdistance(x = X, options = list(approx = FALSE))
respons.approx <- bagdistance(x = X, options = list(approx = TRUE))
# The approximate algorithm leads to a good approximation.
plot(respons.exact$bagdistance, respons.approx$bagdistance)
abline(a = 0, b = 1)

# In Hubert et al. (2015) it was shown that for elliptical
# distributions the bagdistance^2 relates to the Mahalanobis
# distances. This may easily be illustrated.
mahDist <- mahalanobis(x = X, colMeans(X), cov(X))
plot(respons.exact$bagdistance^2, mahDist)

# Computation for the bagdistance relies on the calculation
# of halfspace depth using the hdepth function. Options for
# the hdepth routine can be passed down using the options
# arguments. Note that the affine invariance of the bagdistance
# depens on the affine invariant calculation of the halfspace
# depth. Choosing a different type for hdepth may lead to 
# unsatisfying results. 
options <-list(type = "Rotation",
               ndir = 375,
               approx = TRUE,
               seed = 78341)
respons.exact <- bagdistance(x = X, options = options)





