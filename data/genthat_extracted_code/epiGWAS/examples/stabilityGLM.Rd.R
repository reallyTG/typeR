library(epiGWAS)


### Name: stabilityGLM
### Title: Computes the area under the stability path for all covariates
### Aliases: stabilityGLM

### ** Examples

# ---- Continuous data ----
n <- 50
p <- 20
X <- matrix(rnorm(n * p), ncol = p)
Y <- crossprod(t(X), rnorm(p))
aucs_cont <- stabilityGLM(X, Y, family = "gaussian", n_subsample = 1,
                          short = FALSE)

# ---- Binary data ----
X <- matrix(rnorm(n * p), ncol = p)
Y <- runif(n, min = 0, max = 1) < 1/ (1 + exp(-X[, c(1, 7, 15)] %*% rnorm(3)))
weights <- runif(n, min = 0.4, max = 0.8)
aucs_binary <- stabilityGLM(X, Y, weights = weights,
                            n_lambda = 50, lambda_min_ratio = 0.05, n_subsample = 1)





