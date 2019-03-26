library(pense)
library(testthat)

n <- 100
p <- 1000
lambda <- 1e-4
alpha <- 0.5
set.seed(1234)
weights <- runif(n, 0, 1)
weights <- weights / mean(weights)
x <- matrix(rnorm(p * n), ncol = p, nrow = n)
y <- rnorm(n)

EQUALITY_THRESHOLD <- 1e-5
en_opts_dal <- en_options_dal(eps = 1e-12, preconditioner = "approx")
en_opts_lars <- en_options_aug_lars()

##
## Normal EN without intercept
##
test_that("Normal EN without intercept", {
    el_res_dal <- elnet(x, y, alpha = alpha, lambda = lambda, intercept = FALSE,
                        options = en_opts_dal,
                        correction = FALSE)
    el_res_lars <- elnet(x, y, alpha = alpha, lambda = lambda,
                         intercept = FALSE, options = en_opts_lars,
                         correction = FALSE)

    expect_equal(el_res_dal$coefficients, el_res_lars$coefficients,
                 tolerance = EQUALITY_THRESHOLD)
    expect_equal(el_res_dal$residuals, el_res_lars$residuals)
})


##
## Normal EN with intercept
##
test_that("Normal EN with intercept", {
    el_res_dal <- elnet(x, y, alpha = alpha, lambda = lambda, intercept = TRUE,
                        options = en_opts_dal,
                        correction = FALSE)
    el_res_lars <- elnet(x, y, alpha = alpha, lambda = lambda, intercept = TRUE,
                         options = en_opts_lars,
                         correction = FALSE)

    expect_equal(el_res_dal$coefficients, el_res_lars$coefficients,
                 tolerance = EQUALITY_THRESHOLD)
    expect_equal(el_res_dal$residuals, el_res_lars$residuals,
                 tolerance = EQUALITY_THRESHOLD)

    with(el_res_dal, expect_equal(coefficients[1L],
                                  mean(y - x %*% coefficients[-1L]),
                                  tolerance = EQUALITY_THRESHOLD))
    with(el_res_lars, expect_equal(coefficients[1L],
                                   mean(y - x %*% coefficients[-1L])))
})

##
## Weighted EN without intercept
##
test_that("Weighted EN without intercept", {
    el_res_dal_w <- elnet(x, y, alpha = alpha, lambda = lambda,
                          intercept = FALSE, weights = weights,
                          options = en_opts_dal,
                          correction = FALSE)
    el_res_lars_w <- elnet(x, y, alpha = alpha, lambda = lambda,
                           intercept = FALSE, weights = weights,
                           options = en_opts_lars,
                           correction = FALSE)
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
                          options = en_opts_dal,
                          correction = FALSE)

    el_res_lars_w <- elnet(x, y, alpha = alpha, lambda = lambda,
                           intercept = TRUE, weights = weights,
                           options = en_opts_lars,
                           correction = FALSE)
    expect_equal(el_res_dal_w$coefficients, el_res_lars_w$coefficients,
                 tolerance = EQUALITY_THRESHOLD)
    expect_equal(
        el_res_dal_w$residuals,
        el_res_lars_w$residuals,
        tolerance = EQUALITY_THRESHOLD
    )

    with(el_res_dal_w, expect_equal(
             coefficients[1L],
             weighted.mean(y - x %*% coefficients[-1L], weights),
             tolerance = EQUALITY_THRESHOLD
    ))
    with(el_res_lars_w, expect_equal(
        coefficients[1L],
        weighted.mean(y - x %*% coefficients[-1L], weights),
        tolerance = EQUALITY_THRESHOLD
    ))
})

