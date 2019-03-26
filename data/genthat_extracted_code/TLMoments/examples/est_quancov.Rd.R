library(TLMoments)


### Name: est_quancov
### Title: Estimate the covariance matrix of quantile estimations
### Aliases: est_quancov est_quancov.numeric est_quancov.matrix
###   est_quancov.quantiles

### ** Examples

### Numeric vectors
x <- rgev(500, shape = .2)

quantiles(parameters(TLMoments(x), "gev"), c(.9, .95, .99))
est_quancov(x, "gev", c(.9, .95, .99), 0, 0)
#cov(t(replicate(5000,
#  quantiles(parameters(TLMoments(rgev(500, shape = .2)), "gev"), c(.9, .95, .99))
#)))

quantiles(parameters(TLMoments(x, rightrim = 1), "gev"), c(.9, .95, .99))
est_quancov(x, "gev", c(.9, .95, .99), 0, 1)
#cov(t(replicate(5000,
#  quantiles(
#    parameters(TLMoments(rgev(500, shape = .2), rightrim = 1), "gev"),
#    c(.9, .95, .99)
#  )
#)))

### Numeric matrices
x <- matrix(rgev(600, shape = .2), nc = 3)

quantiles(parameters(TLMoments(x), "gev"), c(.9, .95, .99))
est_quancov(x, "gev", c(.9, .95, .99), 0, 0)

est_quancov(x, "gev", .9, 0, 0)
#cov(t(replicate(5000,
# quantiles(
#   parameters(TLMoments(matrix(rgev(600, shape = .2), nc = 3)),
#  "gev"), .9)
#  )
#))

### quantiles object
q <- quantiles(as.parameters(loc = 3, scale = 2, shape = .4, distr = "gev"), c(.9, .99))
est_quancov(q)
est_quancov(q, leftrim = 0, rightrim = 0)
est_quancov(q, leftrim = 0, rightrim = 0, set.n = 10)




