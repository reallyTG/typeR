library(testthat)
library(pense)

test_that("EN Objective", {
    ## Check that we are indeed solving the problem
    ## 1/(2N) * sum(residuals^2) + lambda * penalty

    # For the following problem, we know that the minimum of our
    # objective function is around 2.112 (between 2.106 and 2.118)
    target_beta <- 2.112
    n <- 500
    set.seed(1234)
    x <- matrix(rnorm(n, sd = 4), ncol = 1L)
    y <- drop(3 * x + rnorm(n))

    lambda <- 10
    alpha <- 0.5

    # Check that every algorithm minimizes the correct objective function
    en_algos <- c("en_options_aug_lars","en_options_dal")

    invisible(lapply(en_algos, function (algorithm) {
        opts_fun <- match.fun(algorithm)
        elres <- elnet(x, y, alpha = alpha, lambda = lambda, intercept = FALSE,
                       options = opts_fun(), correction = FALSE)

        expect_equal(elres$coefficients[2L], target_beta,
                     tolerance = 0.006,
                     check.attributes = FALSE,
                     info = sprintf("Algorithm: %s", algorithm))
    }))

    # Check that every weighted algorithm minimizes the correct objective function
    weights <- rep.int(1, n)
    invisible(lapply(en_algos, function (algorithm) {
        opts_fun <- match.fun(algorithm)
        elres <- elnet(x, y, alpha = alpha, lambda = lambda, intercept = FALSE,
                       options = opts_fun(), weights = weights,
                       correction = FALSE)

        expect_equal(elres$coefficients[2L], target_beta,
                     tolerance = 0.006,
                     check.attributes = FALSE,
                     info = sprintf("Weighted algorithm: %s", algorithm))
    }))

    remove(list = setdiff(ls(), c("en_options", "gradient")))

})
