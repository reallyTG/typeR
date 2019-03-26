context("ccdr_gridR")

pp <- 10L
nn <- 5L
X.test <- data.frame(matrix(runif(pp*pp), ncol = pp))
cors.test <- sparsebnUtils::cor_vector_ivn(X.test)$cors
betas.test <- matrix(runif(pp*pp), ncol = pp)
sigmas.test <- rep(-1, pp)
indexj.test <- rep(0L, pp + 1)
nj.test <- as.integer(rep(nn, pp))
cors.length <- pp*(pp+1)/2
lambda.test <- pi
weights.test <- rep(1, pp*pp)
gamma.test <- 2.0
eps.test <- 0.1
maxIters.test <- 1000L
alpha.test <- 10

### The call for ccdr_gridR
# ccdr_gridR <- function(cors,
#                        pp, nn,
#                        nj = NULL,
#                        indexj = NULL,
#                        betas,
#                        lambdas,
#                        gamma,
#                        eps,
#                        maxIters,
#                        alpha,
#                        verbose)

test_that("ccdr_gridR runs as expected", {
    expect_error(ccdr_gridR(cors = as.numeric(cors.test), pp = pp, nn = nn, betas = betas.test, sigmas = sigmas.test, lambdas = lambda.test, weights = weights.test, gamma = gamma.test, eps = eps.test, maxIters = maxIters.test, alpha = alpha.test, verbose = FALSE),
                 NA)
})
