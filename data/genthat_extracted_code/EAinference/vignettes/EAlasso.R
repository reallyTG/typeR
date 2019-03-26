## ------------------------------------------------------------------------
library(EAinference)
set.seed(1234)
n <- 30; p <- 50
Niter <-  10
group <- rep(1:(p/5), each = 5)
weights <- rep(1, p/5)
beta0 <- c(rep(1,5), rep(0, p-5))
X <- matrix(rnorm(n*p), n)
Y <- X %*% beta0 + rnorm(n)
# set lambda = .5
lassoFit(X = X, Y = Y, lbd = .5, group = group, weights = weights, type="grlasso")
# use cross-validation
lassoFit(X = X, Y = Y, lbd = "cv.1se", group = group, weights = weights, type="grlasso")

## ------------------------------------------------------------------------
set.seed(1234)
n <- 5; p <- 10
Niter <-  3
group <- rep(1:(p/5), each = 5)
weights <- rep(1, p/5)
beta0 <- c(rep(1,5), rep(0, p-5))
X <- matrix(rnorm(n*p), n)
Y <- X %*% beta0 + rnorm(n)
#
# Using non-mixture distribution
#
PBsampler(X = X, PE_1 = rep(0, p), sig2_1 = 1, lbd_1 = .5,
weights = weights, group = group, type = "grlasso", niter = Niter, parallel = FALSE)
#
# Using mixture distribution
#
PBsampler(X = X, PE_1 = rep(0, p), sig2_1 = 1, lbd_1 = .5,
 PE_2 = rep(1, p), sig2_2 = 2, lbd_2 = .3, weights = weights,
 group = group, type = "grlasso", niter = Niter, parallel = FALSE)

## ------------------------------------------------------------------------
# Target distribution parameter
PETarget <- rep(0, p)
sig2Target <- .5
lbdTarget <- .37
# Proposal distribution parameter
PEProp1 <- rep(1, p)
sig2Prop1 <- .5
lbdProp1 <- 1

# Draw samples from proposal distribution
PB <- PBsampler(X = X, PE_1 = PEProp1, sig2_1 = sig2Prop1,
 lbd_1 = lbdProp1, weights = weights, group = group, niter = Niter,
 type="grlasso", PEtype = "coeff")

# Compute importance weights
hdIS(PB, PETarget = PETarget, sig2Target = sig2Target, lbdTarget = lbdTarget,
log = TRUE)

## ------------------------------------------------------------------------
weights <- rep(1,p)
lbd <- .37
LassoResult <- lassoFit(X = X,Y = Y,lbd = lbd, type = "lasso", weights = weights)
B0 <- LassoResult$B0
S0 <- LassoResult$S0
Result <- MHLS(X = X, PE = B0, sig2 = 1, lbd = 1,
    weights = weights, B0 = B0, S0 = S0, niter = 100, burnin = 0,
    PEtype = "coeff")
Result

## ------------------------------------------------------------------------
summary(Result)

## ---- fig.width = 7, fig.height = 4.5------------------------------------
plot(Result, index=c(1,4,9))

## ------------------------------------------------------------------------
postInference.MHLS(X = X, Y = Y, lbd = lbd, sig2.hat = 1, alpha = .05,
 method = "coeff", nChain = 5, niterPerChain = 20, 
 parallel = !(.Platform$OS.type == "windows"))

