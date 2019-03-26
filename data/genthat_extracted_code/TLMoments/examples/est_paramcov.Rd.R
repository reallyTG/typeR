library(TLMoments)


### Name: est_paramcov
### Title: Estimate the covariance matrix of parameter estimations
### Aliases: est_paramcov est_paramcov.numeric est_paramcov.matrix
###   est_paramcov.parameters

### ** Examples

### Numeric vectors
x <- rgev(500, shape = .2)

parameters(TLMoments(x), "gev")
est_paramcov(x, "gev", 0, 0)
#cov(t(replicate(10000, parameters(TLMoments(rgev(500, shape = .2)), "gev"))))

parameters(TLMoments(x, rightrim = 1), "gev")
est_paramcov(x, "gev", 0, 1)
#cov(t(replicate(10000,
#   parameters(TLMoments(rgev(500, shape = .2), rightrim = 1), "gev")
#)))

parameters(TLMoments(x, rightrim = 2), "gev")
est_paramcov(x, "gev", 0, 2)
#cov(t(replicate(10000,
#  parameters(TLMoments(rgev(500, shape = .2), rightrim = 2), "gev")
#)))

### Numeric matrices
x <- matrix(rgev(600, shape = .2), nc = 3)

parameters(TLMoments(x), "gev")
est_paramcov(x, "gev", 0, 0)
#cov(t(replicate(5000,
#  as.vector(parameters(TLMoments(matrix(rgev(600, shape = .2), nc = 3)), "gev")))
#))

### parameters-object
x <- as.parameters(loc = 3, scale = 2, shape = .4, distr = "gev")
est_paramcov(x)
est_paramcov(x, leftrim = 0, rightrim = 0)
est_paramcov(x, leftrim = 0, rightrim = 0, set.n = 100)
# distr-argument can be neglected




