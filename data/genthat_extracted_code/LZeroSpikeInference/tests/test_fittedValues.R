# Sample parameters
gam <- 0.998
gam2 <- 0.818
y <- c(0.9510650, 0.8726557, 1.0582002)
n <- length(y)

# AR1 -------------------
params <- gam
c1 <- computeFittedValues(y, c(0), params, "ar1")

X <- gam ^(0:(n-1))
fit <- lm(y ~ X - 1)
c2 <- fit$fitted.values

test_that("correct fitted values for ar1", {expect_equal(c1, c2)})

# AR1 + intercept -------
params <- gam
c1 <- computeFittedValues(y, c(0), params, "intercept")

X <- cbind(gam ^ (0:(n-1)), rep(1, n))
fit <- lm(y ~ X - 1)
c2 <- fit$fitted.values

test_that("correct fitted values for intercept", {expect_equal(c1, c2)})

# # DEXP ------------------
# params <- c(gam, gam2)
# c1 <- computeFittedValues(y, c(0), params, "dexp")
#
# X <- cbind(gam ^ (0:(n-1)), -gam2 ^ (0:(n-1)))
# fit <- lm(y ~ X - 1)
# c2 <- fit$fitted.values
#
# test_that("correct fitted values for dexp", {expect_equal(c1, c2)})
