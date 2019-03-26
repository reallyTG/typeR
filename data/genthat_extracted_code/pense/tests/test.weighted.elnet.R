library(pense)
library(testthat)

RIDGE_TOLERANCE <- 1e-6
en_opts <- en_options_aug_lars()

.elnet.wfit.rimpl <- function(x, y, weights, alpha, lambda) {
    k <- sqrt(weights)
    xweight <- diag(k) %*% x
    yweight <- k * y

    etat <- crossprod(k, xweight) / sum(weights)
    xweightorth <- xweight - k %*% etat

    res <- elnet(xweightorth, yweight, alpha = alpha, lambda = lambda,
                 intercept = FALSE, options = en_opts)
    res$residuals <- drop(y - x %*% res$coefficients[-1L])
    res$coefficients[1L] <- weighted.mean(res$residuals, weights)
    res$residuals <- res$residuals - res$coefficients[1L]

    return(res)
}

test_that("Weighted LASSO", {
    alpha <- 1
    lambda <- 0.02

    ##
    ## A fairly simple case
    ##
    n <- 100L
    p <- 50L

    set.seed(1234)
    x <- matrix(rnorm(n * p), ncol = p)
    y <- 2 + x %*% c(1, 1, 1, rep.int(0, p - 3L)) + rnorm(n)

    weights <- rchisq(n, 1)

    enres <- elnet(x, y, weights = weights, alpha = alpha, lambda = lambda,
                   options = en_opts)
    enres.rimpl <- .elnet.wfit.rimpl(x, y, weights, alpha, lambda)

    expect_equivalent(enres.rimpl$coefficients, enres$coefficients)

    ##
    ## A fairly simple case with large x values
    ##
    n <- 100L
    p <- 50L

    set.seed(1234)
    x <- 100 * matrix(rnorm(n * p), ncol = p)
    y <- 2 + x %*% c(1, 1, 1, rep.int(0, p - 3L)) + rnorm(n)

    weights <- rchisq(n, 1)

    enres <- elnet(x, y, weights = weights, alpha = alpha, lambda = lambda,
                   options = en_opts)
    enres.rimpl <- .elnet.wfit.rimpl(x, y, weights, alpha, lambda)

    expect_equivalent(enres.rimpl$coefficients, enres$coefficients)

    ##
    ## Some more observations
    ##
    n <- 200L
    p <- 100L

    set.seed(1234)
    x <- matrix(rnorm(n * p), ncol = p)
    y <- 2 + x %*% c(1, 1, 1, rep.int(0, p - 3L)) + rnorm(n)

    weights <- rchisq(n, 1)

    enres <- elnet(x, y, weights = weights, alpha = alpha, lambda = lambda,
                   options = en_opts)
    enres.rimpl <- .elnet.wfit.rimpl(x, y, weights, alpha, lambda)

    expect_equivalent(enres.rimpl$coefficients, enres$coefficients)

    ##
    ## More observations than variables with reasonable regularization
    ##
    n <- 100L
    p <- 50L

    set.seed(1234)
    x <- matrix(rnorm(n * p), ncol = p)
    y <- 2 + x %*% c(1, 1, 1, rep.int(0, p - 3L)) + rnorm(n)

    weights <- rchisq(n, 1)

    enres <- elnet(x, y, weights = weights, alpha = alpha, lambda = lambda,
                   options = en_opts)
    enres.rimpl <- .elnet.wfit.rimpl(x, y, weights, alpha, lambda)

    expect_equivalent(enres.rimpl$coefficients, enres$coefficients)

    ##
    ## More observations than variables with almost no regularization
    ##
    n <- 100L
    p <- 50L

    set.seed(1234)
    x <- matrix(rnorm(n * p), ncol = p)
    y <- 2 + x %*% c(1, 1, 1, rep.int(0, p - 3L)) + rnorm(n)

    weights <- rchisq(n, 1)

    enres <- elnet(x, y, weights = weights, alpha = alpha, lambda = lambda,
                   options = en_opts)
    enres.rimpl <- .elnet.wfit.rimpl(x, y, weights, alpha, lambda)

    expect_equivalent(enres.rimpl$coefficients, enres$coefficients)
})

test_that("Weighted Ridge", {
    alpha <- 0
    lambda <- 0.02

    ##
    ## A fairly simple case
    ##
    n <- 100L
    p <- 50L

    set.seed(1234)
    x <- matrix(rnorm(n * p), ncol = p)
    y <- 2 + x %*% c(1, 1, 1, rep.int(0, p - 3L)) + rnorm(n)

    weights <- rchisq(n, 1)

    enres <- elnet(x, y, weights = weights, alpha = alpha, lambda = lambda,
                   options = en_opts)
    enres.rimpl <- .elnet.wfit.rimpl(x, y, weights, alpha, lambda)

    expect_equal(enres.rimpl$coefficients, enres$coefficients,
                 tolerance = RIDGE_TOLERANCE)

    ##
    ## Some more observations
    ##
    n <- 200L
    p <- 100L

    set.seed(1234)
    x <- matrix(rnorm(n * p), ncol = p)
    y <- 2 + x %*% c(1, 1, 1, rep.int(0, p - 3L)) + rnorm(n)

    weights <- rchisq(n, 1)

    enres <- elnet(x, y, weights = weights, alpha = alpha, lambda = lambda,
                   options = en_opts)
    enres.rimpl <- .elnet.wfit.rimpl(x, y, weights, alpha, lambda)

    expect_equal(enres.rimpl$coefficients, enres$coefficients,
                 tolerance = RIDGE_TOLERANCE)

    ##
    ## More observations than variables with reasonable regularization
    ##
    n <- 100L
    p <- 50L

    set.seed(1234)
    x <- matrix(rnorm(n * p), ncol = p)
    y <- 2 + x %*% c(1, 1, 1, rep.int(0, p - 3L)) + rnorm(n)

    weights <- rchisq(n, 1)

    enres <- elnet(x, y, weights = weights, alpha = alpha, lambda = lambda,
                   options = en_opts)
    enres.rimpl <- .elnet.wfit.rimpl(x, y, weights, alpha, lambda)

    expect_equal(enres.rimpl$coefficients, enres$coefficients,
                 tolerance = RIDGE_TOLERANCE)

    ##
    ## More observations than variables with almost no regularization
    ##
    n <- 100L
    p <- 50L

    set.seed(1234)
    x <- matrix(rnorm(n * p), ncol = p)
    y <- 2 + x %*% c(1, 1, 1, rep.int(0, p - 3L)) + rnorm(n)

    weights <- rchisq(n, 1)

    enres <- elnet(x, y, weights = weights, alpha = alpha, lambda = lambda,
                   options = en_opts)
    enres.rimpl <- .elnet.wfit.rimpl(x, y, weights, alpha, lambda)

    expect_equal(enres.rimpl$coefficients, enres$coefficients,
                 tolerance = RIDGE_TOLERANCE)

})

test_that("Weighted EN", {
    alpha <- 0.5
    lambda <- 0.01

    ##
    ## A fairly simple case without 2 norm penalty
    ##
    n <- 100L
    p <- 50L

    set.seed(1234)
    x <- matrix(rnorm(n * p), ncol = p)
    y <- 2 + x %*% c(1, 1, 1, rep.int(0, p - 3L)) + rnorm(n)

    weights <- rchisq(n, 1)

    enres <- elnet(x, y, weights = weights, alpha = alpha, lambda = lambda,
                   options = en_opts)
    enres.rimpl <- .elnet.wfit.rimpl(x, y, weights, alpha, lambda)

    expect_equivalent(enres.rimpl$coefficients, enres$coefficients)

    ##
    ## A fairly simple case
    ##
    n <- 100L
    p <- 50L

    set.seed(1234)
    x <- matrix(rnorm(n * p), ncol = p)
    y <- 2 + x %*% c(1, 1, 1, rep.int(0, p - 3L)) + rnorm(n)

    weights <- rchisq(n, 1)

    enres <- elnet(x, y, weights = weights, alpha = alpha, lambda = lambda,
                   options = en_opts)
    enres.rimpl <- .elnet.wfit.rimpl(x, y, weights, alpha, lambda)

    expect_equivalent(enres.rimpl$coefficients, enres$coefficients)

    ##
    ## A fairly simple case with many observations
    ##
    n <- 200L
    p <- 100L

    set.seed(1234)
    x <- matrix(rnorm(n * p), ncol = p)
    y <- 2 + x %*% c(1, 1, 1, rep.int(0, p - 3L)) + rnorm(n)

    weights <- rchisq(n, 1)

    enres <- elnet(x, y, weights = weights, alpha = alpha, lambda = lambda,
                   options = en_opts)
    enres.rimpl <- .elnet.wfit.rimpl(x, y, weights, alpha, lambda)

    expect_equivalent(enres.rimpl$coefficients, enres$coefficients)

    ##
    ## More observations than variables with almost no regularization
    ##
    n <- 100L
    p <- 150L

    set.seed(1234)
    x <- matrix(rnorm(n * p), ncol = p)
    y <- 2 + x %*% c(1, 1, 1, rep.int(0, p - 3L)) + rnorm(n)

    weights <- rchisq(n, 1)

    enres <- elnet(x, y, weights = weights, alpha = alpha, lambda = lambda,
                   options = en_opts)
    enres.rimpl <- .elnet.wfit.rimpl(x, y, weights, alpha, lambda)

    expect_equivalent(enres.rimpl$coefficients, enres$coefficients)
})
