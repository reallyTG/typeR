context("ccdr.run")

suppressMessages({
    pp <- 10
    nn <- 5
    X.test <- matrix(runif(pp*pp), ncol = pp)
    dat.test <- sparsebnUtils::sparsebnData(X.test, type = "c")
    betas.test <- matrix(runif(pp*pp), ncol = pp)
    lambdas.test <- c(sqrt(97), 50, 6, pi, exp(1), 1, 0.05)
    lambdas.length.test <- 10
})

# ccdr.run <- function(data,
#                      betas,
#                      lambdas,
#                      lambdas.length = NULL,
#                      gamma = 2.0,
#                      error.tol = 1e-4,
#                      max.iters = NULL,
#                      alpha = 10,
#                      verbose = FALSE
# )

test_that("ccdr.run runs as expected", {
    ### No error / Also tests default values for other parameters
    expect_error(ccdr.run(data = dat.test, lambdas.length = lambdas.length.test), NA)
})

test_that("Check input: dat", {
    ### Check for missing values
    dat.test.na <- dat.test
    dat.test.na$data[1, 1] <- NA
    expect_error(ccdr.run(data = dat.test.na, lambdas.length = lambdas.length.test), "missing values detected")
    rm("dat.test.na")

    ### Does not work on data frames
    expect_error(ccdr.run(data = dat.test$data, lambdas.length = lambdas.length.test), "valid sparsebnData object")

})

test_that("Check input: lambdas", {
    ### No error
    expect_error(ccdr.run(data = dat.test, lambdas = lambdas.test), NA)

    ### Negative values not allowed
    lambdas.test.neg <- lambdas.test
    lambdas.test.neg[3] <- -1 * lambdas.test.neg[3]
    expect_error(ccdr.run(data = dat.test, lambdas = lambdas.test.neg), "only nonnegative values!")

#   ### Integers not allowed
#     lambdas.test.int <- as.integer(lambdas.test)
#     expect_error(ccdr.run(data = dat.test, lambdas = lambdas.test.int), "lambdas must be a numeric vector!")
})

test_that("Check input: lambdas.length", {
    ### Negative values not allowed
    expect_error(ccdr.run(data = dat.test, lambdas.length = -5), "must be positive!")

    ### Zero not allowed
    expect_error(ccdr.run(data = dat.test, lambdas.length = 0), "must be positive!")

    ### Cannot leave both lambdas and lambdas.length empty
    expect_error(ccdr.run(data = dat.test), "Both lambdas and lambdas.length unspecified")
})

test_that("Check input: max.iters", {
    ### maxIters is not an integer
    expect_error(ccdr.run(data = dat.test, lambdas.length = lambdas.length.test, maxx.ters = pi))

    ### maxIters is negative
    expect_error(ccdr.run(data = dat.test, lambdas.length = lambdas.length.test, maxx.ters = -5))
})

test_that("Check input: error.tol", {
    ### error.tol cannot be negative
    expect_error(ccdr.run(data = dat.test, lambdas.length = lambdas.length.test, error.tol = -1), "must be >= 0!")

    ### warning if error.tol is zero
    expect_warning(ccdr.run(data = dat.test, lambdas.length = lambdas.length.test, error.tol = 0), "eps is set to zero")
})

test_that("Check input: gamma", {
    ### gamma = -1 is OK
    expect_error(ccdr.run(data = dat.test, lambdas.length = lambdas.length.test, gamma = -1), NA)

    ### gamma cannot be arbitrary negative number
    expect_error(ccdr.run(data = dat.test, lambdas.length = lambdas.length.test, gamma = -5), "gamma must be >= 0")
})

test_that("Check input: alpha", {
    ### alpha is negative
    expect_error(ccdr.run(data = dat.test, lambdas.length = lambdas.length.test, alpha = -5))
})

test_that("Check input: verbose", {
    ### Works when verbose = TRUE
    expect_error(ccdr.run(data = dat.test, lambdas.length = lambdas.length.test, verbose = TRUE), NA)

    ### Works when verbose = FALSE
    expect_error(ccdr.run(data = dat.test, lambdas.length = lambdas.length.test, verbose = FALSE), NA)
})

