context("ccdr_call")

pp <- 10L
nn <- 5L
X.test <- data.frame(matrix(runif(nn*pp), ncol = pp))
cors.test <- sparsebnUtils::cor_vector_ivn(X.test)$cors
betas.test <- matrix(runif(pp*pp), ncol = pp)
indexj.test <- rep(0L, pp + 1)
nj.test <- as.integer(rep(nn, pp))
cors.length <- pp*(pp+1)/2
lambda.test <- pi
gamma.test <- 2.0
eps.test <- 0.1
maxIters.test <- 1000L
alpha.test <- 10

### The call for ccdr_call
# ccdr_call <- function(data,
#                       ivn = NULL,
#                       betas,
#                       lambdas,
#                       lambdas.length,
#                       gamma,
#                       error.tol,
#                       rlam,
#                       max.iters,
#                       alpha,
#                       verbose = FALSE)

test_that("ccdr_call runs as expected", {
    ### lambdas unspecified
    expect_error(ccdr_call(data = X.test, sigmas = rep(-1, pp), lambdas = NULL, lambdas.length = 20, rlam = 0.01, gamma = gamma.test, error.tol = eps.test, max.iters = maxIters.test, alpha = alpha.test),
                 NA)

    ### lambdas specified
    expect_error(ccdr_call(data = X.test, sigmas = rep(-1, pp), lambdas = c(10, 5, 1), gamma = gamma.test, error.tol = eps.test, max.iters = maxIters.test, alpha = alpha.test),
                 NA)
})

test_that("Check input: data", {
    expect_error(ccdr_call(data = 1, sigmas = rep(-1, pp), lambdas = NULL, lambdas.length = 20, rlam = 0.01, gamma = gamma.test, error.tol = eps.test, max.iters = maxIters.test, alpha = alpha.test),
                 "'data' argument must be a data.frame or matrix!")
    expect_error(ccdr_call(data = matrix(c(NA,1,1,1), nrow = 2), sigmas = rep(-1, pp), lambdas = NULL, lambdas.length = 20, rlam = 0.01, gamma = gamma.test, error.tol = eps.test, max.iters = maxIters.test, alpha = alpha.test),
                 "missing values detected!")
})

test_that("Check input: lambdas, lambdas.length", {
    # lambdas.length
    expect_error(ccdr_call(data = X.test, sigmas = rep(-1, pp), lambdas = NULL, lambdas.length = NULL, rlam = 0.01, gamma = gamma.test, error.tol = eps.test, max.iters = maxIters.test, alpha = alpha.test),
                 "Both lambdas and lambdas.length unspecified: Must specify a value for at least one of these arguments!")
    expect_error(ccdr_call(data = X.test, sigmas = rep(-1, pp), lambdas = NULL, lambdas.length = "test", rlam = 0.01, gamma = gamma.test, error.tol = eps.test, max.iters = maxIters.test, alpha = alpha.test),
                 "lambdas.length must be numeric!")
    expect_error(ccdr_call(data = X.test, sigmas = rep(-1, pp), lambdas = NULL, lambdas.length = -1, rlam = 0.01, gamma = gamma.test, error.tol = eps.test, max.iters = maxIters.test, alpha = alpha.test),
                 "lambdas.length must be positive!")

    # lambdas
    expect_error(ccdr_call(data = X.test, sigmas = rep(-1, pp), lambdas = c(10, "test", 1), gamma = gamma.test, error.tol = eps.test, max.iters = maxIters.test, alpha = alpha.test),
                 "lambdas must be a numeric vector!")
    expect_error(ccdr_call(data = X.test, sigmas = rep(-1, pp), lambdas = c(10, 5, -1), gamma = gamma.test, error.tol = eps.test, max.iters = maxIters.test, alpha = alpha.test),
                 "lambdas must contain only nonnegative values!")
})

test_that("Check input: rlam", {
    expect_error(ccdr_call(data = X.test, sigmas = rep(-1, pp), lambdas = NULL, lambdas.length = 20, gamma = gamma.test, error.tol = eps.test, max.iters = maxIters.test, alpha = alpha.test),
                 "rlam must be specified if lambdas is not explicitly specified.")
    expect_error(ccdr_call(data = X.test, sigmas = rep(-1, pp), lambdas = NULL, lambdas.length = 20, rlam = "test", gamma = gamma.test, error.tol = eps.test, max.iters = maxIters.test, alpha = alpha.test),
                 "rlam must be numeric!")
    expect_error(ccdr_call(data = X.test, sigmas = rep(-1, pp), lambdas = NULL, lambdas.length = 20, rlam = -1, gamma = gamma.test, error.tol = eps.test, max.iters = maxIters.test, alpha = alpha.test),
                 "rlam must be >= 0!")
})

test_that("Maximum number of nodes allowed", {
    # maxnodes.X <- data.frame(matrix(runif(10000*10), ncol = 10000))
    # expect_error(ccdr_call(data = maxnodes.X, lambdas = NULL, lambdas.length = 20, rlam = 0.01, gamma = gamma.test, error.tol = eps.test, max.iters = maxIters.test, alpha = alpha.test), NA)

    maxnodes.X <- data.frame(matrix(runif(10001*10), ncol = 10001))
    expect_error(ccdr_call(data = maxnodes.X, sigmas = rep(-1, pp), lambdas = NULL, lambdas.length = 20, rlam = 0.01, gamma = gamma.test, error.tol = eps.test, max.iters = maxIters.test, alpha = alpha.test),
                 "This dataset contains more")
})


