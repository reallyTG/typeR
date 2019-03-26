library(MFPCA)


### Name: univExpansion
### Title: Calculate a univariate basis expansion
### Aliases: univExpansion

### ** Examples

oldPar <- par(no.readonly = TRUE)
par(mfrow = c(1,1))

set.seed(1234)

### Spline basis ###
# simulate coefficients (scores) for N = 10 observations and K = 8 basis functions
N <- 10
K <- 8
scores <- t(replicate(n = N, rnorm(K, sd = (K:1)/K)))
dim(scores)

# expand spline basis on [0,1]
funs <- univExpansion(type = "splines1D", scores = scores, argvals = list(seq(0,1,0.01)),
                      functions = NULL, # spline functions are known, need not be given
                      params = list(bs = "ps", m = 2, k = K)) # params for mgcv

plot(funs, main = "Spline reconstruction")

### PCA basis ###
# simulate coefficients (scores) for N = 10 observations and K = 8 basis functions
N <- 10
K <- 8

scores <- t(replicate(n = N, rnorm(K, sd = (K:1)/K)))
dim(scores)

# Fourier basis functions as eigenfunctions
eFuns <- eFun(argvals = seq(0,1,0.01), M = K, type = "Fourier")

# expand eigenfunction basis
funs <-  univExpansion(type = "uFPCA", scores = scores,
                       argvals = NULL, # use argvals of eFuns (default)
                       functions = eFuns)

plot(funs, main = "PCA reconstruction")

par(oldPar)



