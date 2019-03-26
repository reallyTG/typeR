library(TLMoments)


### Name: est_tlmcov
### Title: Estimate the covariance matrix of TL-moments estimations
### Aliases: est_tlmcov est_tlmcov.numeric est_tlmcov.matrix
###   est_tlmcov.TLMoments

### ** Examples

### Numeric vectors
x <- rgev(500, loc = 10, scale = 5, shape = .1)

est_tlmcov(x)
est_tlmcov(x, order = 2:3)
est_tlmcov(x, rightrim = 1, order = 4:5)
# cov(t(replicate(10000,
#   TLMoments(rgev(500, loc = 10, scale = 5, shape = .1))$lambdas)
# ))
# cov(t(replicate(10000,
#   TLMoments(rgev(500, loc = 10, scale = 5, shape = .1))$ratios)
# ))

est_tlmcov(x, ratio.cov = FALSE)
est_tlmcov(x, lambda.cov = FALSE)

est_tlmcov(x, distr = "gev")

est_tlmcov(x, leftrim = 0, rightrim = 1)
# cov(t(replicate(10000,
#  TLMoments(rgev(500, loc = 10, scale = 5, shape = .1), 0, 1, 3)$lambdas
# )))
# cov(t(replicate(10000,
#  TLMoments(rgev(500, loc = 10, scale = 5, shape = .1), 0, 1, 3)$ratios
# )))

### Numeric matrices
x <- matrix(rgev(600), nc = 3)

est_tlmcov(x)
est_tlmcov(x, order = 3:4)
# cov(t(replicate(10000,
#   as.vector(TLMoments(matrix(rgev(600), nc = 3))$lambdas[3:4, ])
# )))
# cov(t(replicate(10000,
#   as.vector(TLMoments(matrix(rgev(600), nc = 3))$ratios[3:4, ])
# )))

est_tlmcov(x, ratio.cov = FALSE)
est_tlmcov(x, lambda.cov = FALSE)

TLMoments:::est_tlmcov(x, order = 2:3, distr = "gev")
# cov(t(replicate(10000,
#   as.vector(TLMoments(matrix(rgev(600), nc = 3))$lambdas[2:3, ])
# )))
# cov(t(replicate(10000,
#   as.vector(TLMoments(matrix(rgev(600), nc = 3))$ratios[2:3, ])
# )))

### TLMoments-object (theoretical calculation)
tlm <- TLMoments(as.parameters(loc = 10, scale = 5, shape = .1, distr = "gev"), 0, 1)
est_tlmcov(tlm, distr = "gev", set.n = 100)
est_tlmcov(tlm, distr = "gev", set.n = 100, ratio.cov = FALSE)
est_tlmcov(tlm, distr = "gev", set.n = 100, lambda.cov = FALSE)




