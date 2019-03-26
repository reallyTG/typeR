
# generate data
data = SCPME::data_gen(p = 10, r = 5, n = 1000)

# calculate sample covariance
S = (nrow(data$X) - 1)/nrow(data$X)*cov(data$X)

# lasso type penalty
expect_error(shrink(data$X, data$Y, trace = "none"), NA)

expect_error(shrink(data$X, crit.cv = "loglik", trace = "none"), NA)

# lasso penalty (lam = 0.1)
expect_error(shrink(data$X, data$Y, lam = 0.1, trace = "none"), NA)
expect_warning(shrink(data$X, data$Y, lam = 0.1, trace = "none"), NA)

expect_error(shrink(data$X, crit.cv = "loglik", lam = 0.1, trace = "none"), NA)
expect_warning(shrink(data$X, crit.cv = "loglik", lam = 0.1, trace = "none"), NA)

expect_error(shrink(S = S, crit.cv = "loglik", lam = 0.1, trace = "none"), NA)
expect_warning(shrink(S = S, crit.cv = "loglik", lam = 0.1, trace = "none"), NA)

# parallel CV
#expect_error(shrink(data$X, data$Y, cores = 2, trace = "none"), NA)

# adjmaxit
expect_error(shrink(data$X, data$Y, adjmaxit = 2, trace = "none"), NA)

# path
expect_error(shrink(data$X, data$Y, path = TRUE, trace = "none"), NA)

expect_error(shrink(S = S, crit.cv = "loglik", path = TRUE, trace = "none"), NA)

# example shrink estimator
expect_error(shrink(data$X, data$Y, B = cov(data$X, data$Y), lam.max = max(abs(crossprod(data$X, data$Y))), trace = "none"), NA)
