# Sample parameters
gam <- 0.998
gam2 <- 0.818
y <- c(0.9510650, 0.8726557, 1.0582002)
n <- length(y)

# AR1 -------------------
mtx <- matrix(c(1, sum((y^2)/2), sum(y * gam ^(0:(n-1)))), nrow = 1)
optimalFits <- list(type = "ar1", activeRowSufficientStats = mtx, hardThreshold = FALSE)
params <- gam
c1 <- computeCost(y, optimalFits, 1, n, params)

X <- gam ^(0:(n-1))
fit <- lm(y ~ X - 1)
c2 <- sum(fit$residuals ^ 2) / 2

test_that("correct rss for ar1", {expect_equal(c1, c2)})

# AR1 + intercept -------
mtx <- matrix(c(1, sum((y^2)/2), sum(y * gam ^(0:(n-1))), sum(y)), nrow = 1)
params <- gam
optimalFits <- list(type = "intercept", activeRowSufficientStats = mtx)
c1 <- computeCost(y, optimalFits, 1, n, params)

X <- cbind(gam ^(0:(n-1)), rep(1, n))
fit <- lm(y ~ X - 1)
c2 <- sum(fit$residuals ^ 2) / 2

test_that("correct rss for intercept", {expect_equal(c1, c2)})

# # DEXP ------------------
# mtx <- matrix(c(1, sum((y^2)/2), sum(y * gam ^(0:(n-1))), sum(y * gam2 ^(0:(n-1)))), nrow = 1)
# optimalFits <- list(type = "dexp", activeRowSufficientStats = mtx)
# params <- c(gam, gam2) #data.frame(gammaC = gam, gammaD = gam2)
# c1 <- computeCost(y, optimalFits, 1, n, params)
#
# X <- cbind(gam ^(0:(n-1)), -gam2 ^(0:(n-1)))
# fit <- lm(y ~ X - 1)
# c2 <- sum(fit$residuals ^ 2) / 2
#
# test_that("correct rss for dexp", {expect_equal(c1, c2)})
