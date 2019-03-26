library(pense)
library(testthat)

n <- 100
p <- 1000
lambda <- 1e-5
alpha <- 1
set.seed(1234)
weights <- runif(n, 0, 1)
weights <- weights / mean(weights)
x <- matrix(rnorm(p * n), ncol = p, nrow = n)
y <- rnorm(n)

EQUALITY_THRESHOLD <- 1e-9
en_opts_dal <- en_options_dal(eps = 1e-9, preconditioner = "approx")
en_opts_lars <- en_options_aug_lars()

##
## Normal EN without intercept
##
test_that("Normal EN without intercept", {
    el_res_dal <- elnet(x, y, alpha = alpha, lambda = lambda, intercept = FALSE,
                        options = en_opts_dal)
    el_res_lars <- elnet(x, y, alpha = alpha, lambda = lambda,
                         intercept = FALSE, options = en_opts_lars)

    expect_equal(el_res_dal$coefficients, el_res_lars$coefficients,
                 tolerance = EQUALITY_THRESHOLD)
    expect_equal(el_res_dal$residuals, el_res_lars$residuals)
})


##
## Normal EN with intercept
##
test_that("Normal EN with intercept", {
    el_res_dal <- elnet(x, y, alpha = alpha, lambda = lambda, intercept = TRUE,
                        options = en_opts_dal)
    el_res_lars <- elnet(x, y, alpha = alpha, lambda = lambda, intercept = TRUE,
                         options = en_opts_lars)

    expect_equal(el_res_dal$coefficients, el_res_lars$coefficients,
                 tolerance = EQUALITY_THRESHOLD)
    expect_equal(el_res_dal$residuals, el_res_lars$residuals)

    el_res_dal$coefficients[1L] - el_res_lars$coefficients[1L]
    with(el_res_dal, expect_equal(coefficients[1L],
                                  mean(y - x %*% coefficients[-1L])))
    with(el_res_lars, expect_equal(coefficients[1L],
                                   mean(y - x %*% coefficients[-1L])))
})

##
## Weighted EN without intercept
##
test_that("Weighted EN without intercept", {
    el_res_dal_w <- elnet(x, y, alpha = alpha, lambda = lambda,
                          intercept = FALSE, weights = weights,
                          options = en_opts_dal)
    el_res_lars_w <- elnet(x, y, alpha = alpha, lambda = lambda,
                           intercept = FALSE, weights = weights,
                           options = en_opts_lars)
    expect_equal(el_res_dal_w$coefficients, el_res_lars_w$coefficients,
                 tolerance = EQUALITY_THRESHOLD)
    expect_equal(el_res_dal_w$residuals, el_res_lars_w$residuals)

    with(el_res_dal_w,
         expect_equal(drop(residuals),
                      drop(y - x %*% coefficients[-1L] - coefficients[1L])))

    with(el_res_lars_w,
         expect_equal(drop(residuals),
                      drop(y - x %*% coefficients[-1L] - coefficients[1L])))
})


##
## Weighted EN with intercept
##
test_that("Weighted EN with intercept", {
    el_res_dal_w <- elnet(x, y, alpha = alpha, lambda = lambda,
                          intercept = TRUE, weights = weights,
                          options = en_opts_dal)

    el_res_lars_w <- elnet(x, y, alpha = alpha, lambda = lambda,
                           intercept = TRUE, weights = weights,
                           options = en_opts_lars)
    expect_equal(el_res_dal_w$coefficients, el_res_lars_w$coefficients,
                 tolerance = EQUALITY_THRESHOLD)
    expect_equal(el_res_dal_w$residuals, el_res_lars_w$residuals)

    el_res_dal_w$coefficients[1L] - el_res_lars_w$coefficients[1L]
    with(el_res_dal_w,
         expect_equal(coefficients[1L],
                      weighted.mean(y - x %*% coefficients[-1L], weights)))
    with(el_res_lars_w,
         expect_equal(coefficients[1L],
                      weighted.mean(y - x %*% coefficients[-1L], weights)))
})
