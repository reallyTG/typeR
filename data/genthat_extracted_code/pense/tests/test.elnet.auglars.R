library(testthat)
library(pense)

gradient <- function(coefs, x, y, alpha, lambda) {
    intercept <- coefs[1L]
    beta <- coefs[-1L]

    a <- -crossprod(x, y - x %*% beta - intercept) / length(y)
    p2 <- lambda * (1 - alpha) * beta
    p1 <- lambda * alpha * sign(beta)

    gr <- drop(a + p1 + p2)

    ## If the i-th element of beta is 0, the subgradient of
    ## the L1 norm at the i-th element is [-1; 1]
    gr[(abs(gr) <= 1) & (abs(beta) < .Machine$double.eps)] <- 0

    return(gr)
}

en_options <- en_options_aug_lars()

test_that("LASSO", {
    ##
    ## A fairly simple case
    ##
    n <- 200L
    p <- 150L

    set.seed(1234)
    x <- matrix(rnorm(n * p), ncol = p)
    y <- 2 + x %*% c(1, 1, 1, rep.int(0, p - 3L)) + rnorm(n)

    lambda1 <- 0.02

    enres <- elnet(x, y, alpha = 1, lambda = lambda1, intercept = FALSE,
                   options = en_options)

    ## check if zero is in the gradient
    expect_equal(gradient(enres$coefficients, x, y, 1, lambda1),
                 numeric(p))

    ## check if result is the same as for lars
    if (requireNamespace("lars", quietly = TRUE)) {
        larsobj <- lars::lars(x, y, type = "lasso", normalize = FALSE,
                              intercept = FALSE)
        larsres <- lars::coef.lars(larsobj, s = n * lambda1, mode = "lambda")

        expect_equal(drop(enres$coefficients), c(0, larsres))
    }

    remove(list = setdiff(ls(), c("en_options", "gradient")))

    ##
    ## A fairly simple case with large x values
    ##
    n <- 200L
    p <- 150L

    set.seed(1234)
    x <- 100 * matrix(rnorm(n * p), ncol = p)
    y <- 2 + x %*% c(1, 1, 1, rep.int(0, p - 3L)) + rnorm(n)

    lambda1 <- 0.02

    enres <- elnet(x, y, alpha = 1, lambda = lambda1, intercept = FALSE,
                   options = en_options)

    ## check if zero is in the gradient
    expect_equal(gradient(enres$coefficients, x, y, 1, lambda1),
                 numeric(p))

    ## check if result is the same as for lars
    if (requireNamespace("lars", quietly = TRUE)) {
        larsobj <- lars::lars(x, y, type = "lasso", normalize = FALSE, intercept = FALSE)
        larsres <- lars::coef.lars(larsobj, s = n * lambda1, mode = "lambda")

        expect_equal(drop(enres$coefficients), c(0, larsres))
    }

    remove(list = setdiff(ls(), c("en_options", "gradient")))

    ##
    ## Some more observations
    ##
    n <- 2000L
    p <- 150L

    set.seed(1234)
    x <- matrix(rnorm(n * p), ncol = p)
    y <- 2 + x %*% c(1, 1, 1, rep.int(0, p - 3L)) + rnorm(n)

    lambda1 <- 0.2

    enres <- elnet(x, y, alpha = 1, lambda = lambda1, intercept = FALSE,
                   options = en_options)

    ## check if zero is in the gradient
    expect_equal(gradient(enres$coefficients, x, y, 1, lambda1),
                 numeric(p))

    ## check if result is the same as for lars
    if (requireNamespace("lars", quietly = TRUE)) {
        larsobj <- lars::lars(x, y, type = "lasso", normalize = FALSE,
                              intercept = FALSE)
        larsres <- lars::coef.lars(larsobj, s = n * lambda1, mode = "lambda")

        expect_equal(drop(enres$coefficients), c(0, larsres))
    }

    remove(list = setdiff(ls(), c("en_options", "gradient")))

    ##
    ## More observations than variables with reasonable regularization
    ##
    n <- 100L
    p <- 150L

    set.seed(1234)
    x <- matrix(rnorm(n * p), ncol = p)
    y <- 2 + x %*% c(1, 1, 1, rep.int(0, p - 3L)) + rnorm(n)

    lambda1 <- 0.02

    enres <- elnet(x, y, alpha = 1, lambda = lambda1, intercept = FALSE,
                   options = en_options)

    ## check if zero is in the gradient
    expect_equal(gradient(enres$coefficients, x, y, 1, lambda1),
                 numeric(p))

    ## check if result is the same as for lars
    if (requireNamespace("lars", quietly = TRUE)) {
        larsobj <- lars::lars(x, y, type = "lasso", normalize = FALSE,
                              intercept = FALSE)
        larsres <- lars::coef.lars(larsobj, s = n * lambda1, mode = "lambda")

        expect_equal(drop(enres$coefficients), c(0, larsres))
    }

    remove(list = setdiff(ls(), c("en_options", "gradient")))

    ##
    ## More variables than observations with almost no regularization
    ##
    n <- 100L
    p <- 150L

    set.seed(1234)
    x <- matrix(rnorm(n * p), ncol = p)
    y <- 2 + x %*% c(1, 1, 1, rep.int(0, p - 3L)) + rnorm(n)

    lambda1 <- 0.00002

    enres <- elnet(x, y, alpha = 1, lambda = lambda1, intercept = FALSE,
                   options = en_options)

    ## check if zero is in the gradient
    expect_equal(gradient(enres$coefficients, x, y, 1, lambda1),
                 numeric(p))

    ## check if result is the same as for lars
    if (requireNamespace("lars", quietly = TRUE)) {
        larsobj <- lars::lars(x, y, type = "lasso", normalize = FALSE,
                              intercept = FALSE)
        larsres <- lars::coef.lars(larsobj, s = n * lambda1, mode = "lambda")

        expect_equal(drop(enres$coefficients), c(0, larsres))
    }

    remove(list = setdiff(ls(), c("en_options", "gradient")))
})

test_that("Ridge", {
    augment <- function(x, y, lambda2, leading1s = TRUE) {
        d <- dim(x)

        ext <- diag(sqrt(n * lambda2), ncol = d[2L], nrow = d[2L])

        if (identical(leading1s, TRUE)) {
            x <- cbind(1, x)
            ext <- cbind(0, ext)
        }

        return(list(
            x = rbind(x, ext),
            y = c(y, numeric(d[2L]))
        ))
    }

    ##
    ## A fairly simple case
    ##
    n <- 200L
    p <- 150L

    set.seed(1234)
    x <- matrix(rnorm(n * p), ncol = p)
    y <- 2 + x %*% c(1, 1, 1, rep.int(0, p - 3L)) + rnorm(n)

    lambda2 <- 0.2

    au <- augment(x, y, lambda2)

    enres <- elnet(x, y, alpha = 0, lambda = lambda2, intercept = TRUE,
                   options = en_options, correction = FALSE)
    olsres <- .lm.fit(au$x, au$y)

    expect_equal(drop(enres$coefficients), olsres$coefficients)

    ## check if zero is in the gradient
    expect_equal(gradient(enres$coefficients, x, y, 0, lambda2),
                 numeric(p))

    remove(list = setdiff(ls(), c("en_options", "gradient", "augment")))

    ##
    ## Some more observations
    ##
    n <- 2000L
    p <- 150L

    set.seed(1234)
    x <- matrix(rnorm(n * p), ncol = p)
    y <- 2 + x %*% c(1, 1, 1, rep.int(0, p - 3L)) + rnorm(n)

    lambda2 <- 0.2
    au <- augment(x, y, lambda2)

    enres <- elnet(x, y, alpha = 0, lambda = lambda2, intercept = TRUE,
                   options = en_options, correction = FALSE)
    olsres <- .lm.fit(au$x, au$y)

    expect_equal(drop(enres$coefficients), olsres$coefficients)

    ## check if zero is in the gradient
    expect_equal(gradient(enres$coefficients, x, y, 0, lambda2),
                 numeric(p))

    remove(list = setdiff(ls(), c("en_options", "gradient", "augment")))

    ##
    ## More observations than variables with reasonable regularization
    ##
    n <- 100L
    p <- 150L

    set.seed(1234)
    x <- matrix(rnorm(n * p), ncol = p)
    y <- 2 + x %*% c(1, 1, 1, rep.int(0, p - 3L)) + rnorm(n)

    lambda2 <- 3
    au <- augment(x, y, lambda2)

    enres <- elnet(x, y, alpha = 0, lambda = lambda2, intercept = TRUE,
                   options = en_options, correction = FALSE)
    olsres <- .lm.fit(au$x, au$y)

    expect_equal(drop(enres$coefficients), olsres$coefficients)

    ## check if zero is in the gradient
    expect_equal(gradient(enres$coefficients, x, y, 0, lambda2),
                 numeric(p))

    remove(list = setdiff(ls(), c("en_options", "gradient", "augment")))

    ##
    ## More observations than variables with almost no regularization
    ##
    n <- 100L
    p <- 150L

    set.seed(1234)
    x <- matrix(rnorm(n * p), ncol = p)
    y <- 2 + x %*% c(1, 1, 1, rep.int(0, p - 3L)) + rnorm(n)

    lambda2 <- 1
    au <- augment(x, y, lambda2)

    enres <- elnet(x, y, alpha = 0, lambda = lambda2, intercept = TRUE,
                   options = en_options, correction = FALSE)
    olsres <- .lm.fit(au$x, au$y)

    expect_equal(drop(enres$coefficients), olsres$coefficients)

    ## check if zero is in the gradient
    expect_equal(gradient(enres$coefficients, x, y, 0, lambda2),
                 numeric(p))

    remove(list = setdiff(ls(), c("en_options", "gradient", "augment")))
})

test_that("EN", {
    augment <- function(x, y, lambda2, leading1s = TRUE) {
        d <- dim(x)

        ext <- diag(sqrt(lambda2 * n * 2), ncol = d[2L], nrow = d[2L])

        if (identical(leading1s, TRUE)) {
            x <- cbind(1, x)
            ext <- cbind(0, ext)
        }

        return(list(
            x = rbind(x, ext),
            y = c(y, numeric(d[2L]))
        ))
    }

    ##
    ## A fairly simple case without 2 norm penalty
    ##
    n <- 200L
    p <- 150L

    set.seed(1234)
    x <- matrix(rnorm(n * p), ncol = p)
    y <- 2 + x %*% c(1, 1, 1, rep.int(0, p - 3L)) + rnorm(n)

    lambda2 <- 0
    lambda1 <- 0.05

    lambda <- 2 * lambda2 + lambda1
    alpha <- lambda1 / (2 * lambda2 + lambda1)

    enres <- elnet(x, y, alpha = alpha, lambda = lambda, intercept = FALSE,
                   options = en_options, correction = FALSE)

    ## check if zero is in the gradient
    expect_equal(gradient(enres$coefficients, x, y, alpha, lambda),
                 numeric(p))

    ## check if we can match the result by augmenting the data
    au <- augment(x, y, lambda2, leading1s = FALSE)

    elau <- elnet(au$x, au$y, alpha = 1, lambda = n * lambda1 / (n + p),
                  intercept = FALSE, options = en_options, correction = FALSE)
    expect_equal(drop(enres$coefficients)[-1L], elau$coefficients[-1L])

    ## check if results match with lars
    if (requireNamespace("lars", quietly = TRUE)) {
        larsobj <- lars::lars(au$x, au$y, type = "lasso", normalize = FALSE,
                              intercept = FALSE)
        larsres <- lars::coef.lars(larsobj, s = n * lambda1, mode = "lambda")
        expect_equal(drop(enres$coefficients)[-1L], larsres)
    }

    remove(list = setdiff(ls(), c("en_options", "gradient", "augment")))

    ##
    ## A fairly simple case
    ##
    n <- 200L
    p <- 150L

    set.seed(1234)
    x <- matrix(rnorm(n * p), ncol = p)
    y <- 2 + x %*% c(1, 1, 1, rep.int(0, p - 3L)) + rnorm(n)

    lambda2 <- 0.02
    lambda1 <- 0.1

    lambda <- 2 * lambda2 + lambda1
    alpha <- lambda1 / (2 * lambda2 + lambda1)

    enres <- elnet(x, y, alpha = alpha, lambda = lambda, intercept = FALSE,
                   options = en_options, correction = FALSE)

    ## check if zero is in the gradient
    expect_equal(gradient(enres$coefficients, x, y, alpha, lambda),
                 numeric(p))

    ## check if we can match the result by augmenting the data
    au <- augment(x, y, lambda2, leading1s = FALSE)

    elau <- elnet(au$x, au$y, alpha = 1, lambda = n * lambda1 / (n + p),
                  intercept = FALSE, options = en_options, correction = FALSE)
    expect_equal(drop(enres$coefficients)[-1L], elau$coefficients[-1L])

    ## check if results match with lars
    if (requireNamespace("lars", quietly = TRUE)) {
        larsobj <- lars::lars(au$x, au$y, type = "lasso", normalize = FALSE,
                              intercept = FALSE)
        larsres <- lars::coef.lars(larsobj, s = n * lambda1, mode = "lambda")
        expect_equal(drop(enres$coefficients)[-1L], larsres)
    }

    remove(list = setdiff(ls(), c("en_options", "gradient", "augment")))

    ##
    ## A fairly simple case with many observations
    ##
    n <- 2000L
    p <- 150L

    set.seed(1234)
    x <- matrix(rnorm(n * p), ncol = p)
    y <- 2 + x %*% c(1, 1, 1, rep.int(0, p - 3L)) + rnorm(n)

    lambda2 <- 0.005
    lambda1 <- 0.02

    lambda <- 2 * lambda2 + lambda1
    alpha <- lambda1 / (2 * lambda2 + lambda1)

    enres <- elnet(x, y, alpha = alpha, lambda = lambda, intercept = FALSE,
                   options = en_options, correction = FALSE)

    ## check if zero is in the gradient
    expect_equal(gradient(enres$coefficients, x, y, alpha, lambda),
                 numeric(p))

    ## check if we can match the result by augmenting the data
    au <- augment(x, y, lambda2, leading1s = FALSE)

    elau <- elnet(au$x, au$y, alpha = 1, lambda = n * lambda1 / (n + p),
                  intercept = FALSE, options = en_options, correction = FALSE)
    expect_equal(drop(enres$coefficients)[-1L], elau$coefficients[-1L])

    ## check if results match with lars
    if (requireNamespace("lars", quietly = TRUE)) {
        larsobj <- lars::lars(au$x, au$y, type = "lasso", normalize = FALSE,
                              intercept = FALSE)
        larsres <- lars::coef.lars(larsobj, s = n * lambda1, mode = "lambda")
        expect_equal(drop(enres$coefficients)[-1L], larsres)
    }

    remove(list = setdiff(ls(), c("en_options", "gradient", "augment")))
})

test_that("EN - Bugs", {
    n <- 100L
    p <- 100L
    ##
    ## Test behaviour when no observations are given
    ##
    x <- matrix(0.0, ncol = p, nrow = 0L)
    y <- numeric(0L)
    res <- elnet(x, y, alpha = 0.5, lambda = 2, options = en_options,
                 correction = FALSE)

    # All coefficients should be NA and residuals of length zero
    expect_identical(
        res$coefficients,
        matrix(rep.int(NA_real_, p + 1L), ncol = 1L)
    )
    expect_identical(res$residuals, matrix(NA_real_, ncol = 1L, nrow = 0L))

    ##
    ## Test behaviour when no columns are given
    ##
    x <- matrix(0.0, ncol = 0L, nrow = n)
    y <- rnorm(n)
    res <- elnet(x, y, alpha = 0.5, lambda = 2, intercept = FALSE,
                 options = en_options)

    # The coefficients should be an empty matrix
    expect_identical(res$coefficients, matrix(NA_real_, ncol = 1L, nrow = 0L))
    expect_equal(res$residuals, matrix(y, ncol = 1L))

    ##
    ## Test behaviour when only the column of 1's is given (i.e., average)
    ##
    x <- matrix(0.0, ncol = 0L, nrow = n)
    y <- rnorm(n)
    res <- elnet(x, y, alpha = 0.5, lambda = 2, options = en_options)

    # The coefficients should be the intercept only
    expect_equal(res$coefficients, matrix(mean(y), ncol = 1L))
    expect_equal(res$residuals, matrix(y - mean(y), ncol = 1L))
})
