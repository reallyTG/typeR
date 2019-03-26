library(EAinference)


### Name: postInference.MHLS
### Title: Post-inference with lasso estimator
### Aliases: postInference.MHLS

### ** Examples

set.seed(123)
n <- 6
p <- 10
X <- matrix(rnorm(n*p),n)
Y <- X %*% rep(1,p) + rnorm(n)
sig2 <- 1
lbd <- .37
weights <- rep(1,p)
parallel <- (.Platform$OS.type != "windows")
postInference.MHLS(X = X, Y = Y, lbd = lbd, sig2.hat = 1, alpha = .05,
nChain = 3, niterPerChain = 20, method = "coeff", parallel = parallel)
postInference.MHLS(X = X, Y = Y, lbd = lbd, sig2.hat = 1, alpha = .05,
nChain = 3, niterPerChain = 20, method = "coeff", parallel = parallel, returnSamples = TRUE)
postInference.MHLS(X = X, Y = Y, lbd = lbd, sig2.hat = 1, alpha = .05,
nChain = 3, niterPerChain = 20, method = "mu", parallel = parallel)
postInference.MHLS(X = X, Y = Y, lbd = lbd, sig2.hat = 1, alpha = .05,
nChain = 3, niterPerChain = 20, method = "mu", parallel = parallel, returnSamples = TRUE)



