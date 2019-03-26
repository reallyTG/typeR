context("ccdr_singleR")

pp <- 10L
nn <- 5L
indexj.test <- rep(0L, pp + 1)
nj.test <- as.integer(rep(nn, pp))
cors.length <- pp*(pp+1)/2
cors.test <- runif(cors.length)
betas.test <- matrix(runif(pp*pp), ncol = pp)
sigmas.test <- rep(-1, pp)
lambda.test <- pi
weights.test <- rep(1, pp*pp)
gamma.test <- 2.0
eps.test <- 0.1
maxIters.test <- 1000L
alpha.test <- 10

### The call for ccdr_singleR
# ccdr_singleR <- function(cors,
#                           pp, nn,
#                           betas,
#                           nj = NULL,
#                           indexj = NULL,
#                           sigmas,
#                           lambda,
#                           gamma,
#                           eps,
#                           maxIters,
#                           alpha,
#                           verbose = FALSE)

test_that("ccdr_singleR runs as expected", {
    ### Throw error if parameter and initial values not explicitly specified
    expect_error(ccdr_singleR(cors = cors.test))

    ### No error
    expect_error(ccdr_singleR(cors = cors.test, pp = pp, nn = nn, betas = betas.test, sigmas = sigmas.test, lambda = lambda.test, weights = weights.test, gamma = gamma.test, eps = eps.test, maxIters = maxIters.test, alpha = alpha.test),
                 NA)

    ### No error
    expect_error(ccdr_singleR(cors = cors.test, pp = pp, nn = nn, nj = nj.test, indexj = indexj.test, betas = betas.test, sigmas = sigmas.test, lambda = lambda.test, weights = weights.test, gamma = gamma.test, eps = eps.test, maxIters = maxIters.test, alpha = alpha.test),
                 NA)

})

test_that("Check input: cors", {

    ### Throw error if cors has length != pp*(pp+1)/2
    expect_error(ccdr_singleR(cors = cors.test[-1], pp = pp, nn = nn, betas = betas.test, sigmas = sigmas.test, lambda = lambda.test, weights = weights.test, gamma = gamma.test, eps = eps.test, maxIters = maxIters.test, alpha = alpha.test),
                 "cors has incorrect length")
})

test_that("Check input: pp", {

    ### pp is not an integer
    expect_error(ccdr_singleR(cors = cors.test, pp = pi, nn = nn, betas = betas.test, sigmas = sigmas.test, lambda = lambda.test, weights = weights.test, gamma = gamma.test, eps = eps.test, maxIters = maxIters.test, alpha = alpha.test),
                 "Both pp and nn must be integers")

    ### pp is not > 0
    expect_error(ccdr_singleR(cors = cors.test, pp = -1L, nn = nn, betas = betas.test, sigmas = sigmas.test, lambda = lambda.test, weights = weights.test, gamma = gamma.test, eps = eps.test, maxIters = maxIters.test, alpha = alpha.test),
                 "Both pp and nn must be positive")
})

test_that("Check input: nn", {

    ### nn is not an integer
    expect_error(ccdr_singleR(cors = cors.test, pp = pp, nn = pi, betas = betas.test, sigmas = sigmas.test, lambda = lambda.test, weights = weights.test, gamma = gamma.test, eps = eps.test, maxIters = maxIters.test, alpha = alpha.test),
                 "Both pp and nn must be integers")

    ### nn is not > 0
    expect_error(ccdr_singleR(cors = cors.test, pp = pp, nn = -1L, betas = betas.test, sigmas = sigmas.test, lambda = lambda.test, weights = weights.test, gamma = gamma.test, eps = eps.test, maxIters = maxIters.test, alpha = alpha.test),
                 "Both pp and nn must be positive")
})

test_that("Check input: indexj", {
    ### indexj is defined to be a vector containing the start position of the correlation matrix for node j in 'cors'

    ### indexj is not a vector
    expect_error(ccdr_singleR(cors = cors.test, pp = pp, nn = nn, indexj = matrix(0L, nrow = 1, ncol = pp + 1), betas = betas.test, sigmas = sigmas.test, lambda = lambda.test, weights = weights.test, gamma = gamma.test, eps = eps.test, maxIters = maxIters.test, alpha = alpha.test),
                 "Index vector for cors is not a vector")

    ### indexj is of wrong size
    expect_error(ccdr_singleR(cors = cors.test, pp = pp, nn = nn, indexj = rep(0L, pp + 2), betas = betas.test, sigmas = sigmas.test, lambda = lambda.test, weights = weights.test, gamma = gamma.test, eps = eps.test, maxIters = maxIters.test, alpha = alpha.test),
                 "Index vector for cors is too long")

    ### indexj has non-integer
    indexj1 <- indexj.test
    indexj1[1] <- pi
    expect_error(ccdr_singleR(cors = cors.test, pp = pp, nn = nn, indexj = indexj1, betas = betas.test, sigmas = sigmas.test, lambda = lambda.test, weights = weights.test, gamma = gamma.test, eps = eps.test, maxIters = maxIters.test, alpha = alpha.test),
                 "Index vector for cors has non-integer")

    indexj1 <- indexj.test
    indexj1[1] <- NA
    expect_error(ccdr_singleR(cors = cors.test, pp = pp, nn = nn, indexj = indexj1, betas = betas.test, sigmas = sigmas.test, lambda = lambda.test, weights = weights.test, gamma = gamma.test, eps = eps.test, maxIters = maxIters.test, alpha = alpha.test),
                 "Index vector cannot have missing or NULL values")

    ### indexj out of bound
    indexj1 <- indexj.test
    indexj1[1] <- -1L
    expect_error(ccdr_singleR(cors = cors.test, pp = pp, nn = nn, indexj = indexj1, betas = betas.test, sigmas = sigmas.test, lambda = lambda.test, weights = weights.test, gamma = gamma.test, eps = eps.test, maxIters = maxIters.test, alpha = alpha.test),
                 "Index vector for cors has out-of-range")

    indexj1 <- indexj.test
    indexj1[1] <- as.integer(pp + 2)
    expect_error(ccdr_singleR(cors = cors.test, pp = pp, nn = nn, indexj = indexj1, betas = betas.test, sigmas = sigmas.test, lambda = lambda.test, weights = weights.test, gamma = gamma.test, eps = eps.test, maxIters = maxIters.test, alpha = alpha.test),
                 "Index vector for cors has out-of-range")
})

test_that("Check input: nj", {
    ### nj is defined to be a vector containing the number of times each node is free of intervention (to replace nn)

    ### nj is not a vector
    expect_error(ccdr_singleR(cors = cors.test, pp = pp, nn = nn, nj = matrix(nn, nrow = 1, ncol = pp), betas = betas.test, sigmas = sigmas.test, lambda = lambda.test, weights = weights.test, gamma = gamma.test, eps = eps.test, maxIters = maxIters.test, alpha = alpha.test),
                 "Intervention times vector is not a vector")

    ### nj is of wrong size
    expect_error(ccdr_singleR(cors = cors.test, pp = pp, nn = nn, nj = as.integer(rep(nn, pp + 1)), betas = betas.test, sigmas = sigmas.test, lambda = lambda.test, weights = weights.test, gamma = gamma.test, eps = eps.test, maxIters = maxIters.test, alpha = alpha.test),
                 "Length of intervention times vector")

    ### nj has non-integer
    nj1 <- nj.test
    nj1[1] <- pi
    expect_error(ccdr_singleR(cors = cors.test, pp = pp, nn = nn, nj = nj1, betas = betas.test, sigmas = sigmas.test, lambda = lambda.test, weights = weights.test, gamma = gamma.test, eps = eps.test, maxIters = maxIters.test, alpha = alpha.test),
                 "Intervention times vector has non-integer")
    nj1 <- nj.test
    nj1[1] <- NA
    expect_error(ccdr_singleR(cors = cors.test, pp = pp, nn = nn, nj = nj1, betas = betas.test, sigmas = sigmas.test, lambda = lambda.test, weights = weights.test, gamma = gamma.test, eps = eps.test, maxIters = maxIters.test, alpha = alpha.test),
                 "Intervention times vector cannot have missing or NULL")

    ### nj out of bound
    nj1 <- nj.test
    nj1 <- rep(-1L, pp)
    expect_error(ccdr_singleR(cors = cors.test, pp = pp, nn = nn, nj = nj1, betas = betas.test, sigmas = sigmas.test, lambda = lambda.test, weights = weights.test, gamma = gamma.test, eps = eps.test, maxIters = maxIters.test, alpha = alpha.test),
                 "Intervention times vector has out-of-range")

    nj1 <- nj.test
    nj1 <- as.integer(rep(nn + 1, pp))
    expect_error(ccdr_singleR(cors = cors.test, pp = pp, nn = nn, nj = nj1, betas = betas.test, sigmas = sigmas.test, lambda = lambda.test, weights = weights.test, gamma = gamma.test, eps = eps.test, maxIters = maxIters.test, alpha = alpha.test),
                 "Intervention times vector has out-of-range")
})

test_that("Check input: betas", {

    ### betas is not a matrix or SparseBlockMatrixR
    expect_error(ccdr_singleR(cors = cors.test, pp = pp, nn = nn, betas = as.numeric(betas.test), sigmas = sigmas.test, lambda = lambda.test, weights = weights.test, gamma = gamma.test, eps = eps.test, maxIters = maxIters.test, alpha = alpha.test),
                 "Incompatible data passed for betas parameter")

    ### If betas = zeroes and lambda = sqrt(n), then output should be zero
    final <- ccdr_singleR(cors = cors.test, pp = pp, nn = nn, betas = matrix(0, nrow = pp, ncol = pp), sigmas = sigmas.test, lambda = sqrt(nn), weights = weights.test, gamma = gamma.test, eps = eps.test, maxIters = maxIters.test, alpha = alpha.test)
    expect_true(is.zero(final$sbm))
})

test_that("Check input: sigmas", {
    ### sigmas is numeric
    expect_error(ccdr_singleR(cors = cors.test, pp = pp, nn = nn, betas = betas.test, sigmas = rep("a", pp), lambda = lambda.test, weights = weights.test, gamma = gamma.test, eps = eps.test, maxIters = maxIters.test, alpha = alpha.test),
                 "sigmas must be numeric")

    ### sigmas has correct length
    expect_error(ccdr_singleR(cors = cors.test, pp = pp, nn = nn, betas = betas.test, sigmas = rep(1, pp+1), lambda = lambda.test, weights = weights.test, gamma = gamma.test, eps = eps.test, maxIters = maxIters.test, alpha = alpha.test),
                 "sigmas must have length")

    ### Negative values other than 1 fail
    sigmas1 <- sigmas.test
    sigmas1[1] <- -2
    expect_error(ccdr_singleR(cors = cors.test, pp = pp, nn = nn, betas = betas.test, sigmas = sigmas1, lambda = lambda.test, weights = weights.test, gamma = gamma.test, eps = eps.test, maxIters = maxIters.test, alpha = alpha.test),
                 "sigmas must be > 0!")

    ### Combination of +/- values fails
    sigmas1 <- runif(pp)
    sigmas1[1] <- -1
    expect_error(ccdr_singleR(cors = cors.test, pp = pp, nn = nn, betas = betas.test, sigmas = sigmas1, lambda = lambda.test, weights = weights.test, gamma = gamma.test, eps = eps.test, maxIters = maxIters.test, alpha = alpha.test),
                 "sigmas must be > 0!")
})

test_that("Check input: lambda", {

    ### lambda is numeric
    expect_error(ccdr_singleR(cors = cors.test, pp = pp, nn = nn, betas = betas.test, sigmas = sigmas.test, lambda = "a", weights = weights.test, gamma = gamma.test, eps = eps.test, maxIters = maxIters.test, alpha = alpha.test),
                 "lambda must be numeric")

    ### lambda is negative
    expect_error(ccdr_singleR(cors = cors.test, pp = pp, nn = nn, betas = betas.test, sigmas = sigmas.test, lambda = -lambda.test, weights = weights.test, gamma = gamma.test, eps = eps.test, maxIters = maxIters.test, alpha = alpha.test),
                 "lambda must be >= 0")
})

test_that("Check input: weights", {

    ### weights is length pp*pp
    expect_error(ccdr_singleR(cors = cors.test, pp = pp, nn = nn, betas = betas.test, sigmas = sigmas.test, lambda = lambda.test, weights = c(1, weights.test), gamma = gamma.test, eps = eps.test, maxIters = maxIters.test, alpha = alpha.test),
                 "weights must have length p")

    ### weights is numeric
    expect_error(ccdr_singleR(cors = cors.test, pp = pp, nn = nn, betas = betas.test, sigmas = sigmas.test, lambda = lambda.test, weights = rep("a", pp*pp), gamma = gamma.test, eps = eps.test, maxIters = maxIters.test, alpha = alpha.test),
                 "weights must be numeric")

    ### weight > 1
    weights.test <- rep(1, pp*pp)
    weights.test[1] <- 2
    expect_error(ccdr_singleR(cors = cors.test, pp = pp, nn = nn, betas = betas.test, sigmas = sigmas.test, lambda = lambda.test, weights = weights.test, gamma = gamma.test, eps = eps.test, maxIters = maxIters.test, alpha = alpha.test),
                 "weights out of bounds")

    ### weight < 1
    weights.test <- rep(1, pp*pp)
    weights.test[1] <- -2
    expect_error(ccdr_singleR(cors = cors.test, pp = pp, nn = nn, betas = betas.test, sigmas = sigmas.test, lambda = lambda.test, weights = weights.test, gamma = gamma.test, eps = eps.test, maxIters = maxIters.test, alpha = alpha.test),
                 "weights out of bounds")

})

test_that("Check input: gamma", {

    ### gamma is numeric
    expect_error(ccdr_singleR(cors = cors.test, pp = pp, nn = nn, betas = betas.test, sigmas = sigmas.test, lambda = lambda.test, weights = weights.test, gamma = "a", eps = eps.test, maxIters = maxIters.test, alpha = alpha.test),
                 "gamma must be numeric")

    ### gamma is negative
    expect_error(ccdr_singleR(cors = cors.test, pp = pp, nn = nn, betas = betas.test, sigmas = sigmas.test, lambda = lambda.test, weights = weights.test, gamma = -5, eps = eps.test, maxIters = maxIters.test, alpha = alpha.test),
                 "gamma must be >= 0")

    ### gamma = -1 is OK
    expect_error(ccdr_singleR(cors = cors.test, pp = pp, nn = nn, betas = betas.test, sigmas = sigmas.test, lambda = lambda.test, weights = weights.test, gamma = -1, eps = eps.test, maxIters = maxIters.test, alpha = alpha.test),
                 NA)

})

test_that("Check input: eps", {

    ### eos is numeric
    expect_error(ccdr_singleR(cors = cors.test, pp = pp, nn = nn, betas = betas.test, sigmas = sigmas.test, lambda = lambda.test, weights = weights.test, gamma = gamma.test, eps = "a", maxIters = maxIters.test, alpha = alpha.test),
                 "eps must be numeric")

    ### eps is negative
    expect_error(ccdr_singleR(cors = cors.test, pp = pp, nn = nn, betas = betas.test, sigmas = sigmas.test, lambda = lambda.test, weights = weights.test, gamma = gamma.test, eps = -5, maxIters = maxIters.test, alpha = alpha.test),
                 "eps must be >= 0")

    ### Output warning if user sets eps = 0
    expect_warning(ccdr_singleR(cors = cors.test, pp = pp, nn = nn, betas = betas.test, sigmas = sigmas.test, lambda = lambda.test, weights = weights.test, gamma = gamma.test, eps = 0, maxIters = maxIters.test, alpha = alpha.test),
                   "eps is set to zero")
})

test_that("Check input: maxIters", {

    ### maxIters is integer
    expect_error(ccdr_singleR(cors = cors.test, pp = pp, nn = nn, betas = betas.test, sigmas = sigmas.test, lambda = lambda.test, weights = weights.test, gamma = gamma.test, eps = eps.test, maxIters = 5, alpha = alpha.test),
                 "maxIters must be an integer")

    ### maxIters is negative
    expect_error(ccdr_singleR(cors = cors.test, pp = pp, nn = nn, betas = betas.test, sigmas = sigmas.test, lambda = lambda.test, weights = weights.test, gamma = gamma.test, eps = eps.test, maxIters = -5L, alpha = alpha.test),
                 "maxIters must be > 0")
})

test_that("Check input: alpha", {

    ### TODO

})
