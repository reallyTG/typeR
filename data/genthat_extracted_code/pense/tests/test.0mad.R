library(testthat)
library(pense)

test_that("Predictors with 0 scale", {
    n <- 50
    p <- 5
    set.seed(123)
    x <- matrix(rnorm(n * p), ncol = p)
    x[ , 1L] <- 1L  # add a column with 0 scale
    y <- rowSums(x) + rnorm(n)

    # PENSE(M) should give a meaningful error when standardizing a 0-scale
    # predictor
    expect_error(pense(x, y, standardize = TRUE), grep = 'MAS of 0')
    expect_error(pensem(x, y, standardize = TRUE), grep = 'MAS of 0')
})
