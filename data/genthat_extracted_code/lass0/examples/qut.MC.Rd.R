library(lass0)


### Name: qut.MC
### Title: Monte Carlo simulation for estimating the Quantile Universal
###   Threshold
### Aliases: qut.MC

### ** Examples

### Fast toy example with 5x10 input matrix and a small number (MCrep = 50)
### of Monte Carlo replications.
### Illustrates how to tune Lasso-Zero with QUT for the same input matrix but
### different responses and/or different alpha values, without calling
### qut.MC several times:

### (for faster computation when X and MCrep are larger: register a parallel 
### backend and choose parallel = TRUE when calling lass0 and qut.MC functions.)

set.seed(3)

## input matrix:
n <- 5
p <- 10
X <- matrix(rnorm(n*p), n, p)

## two sparse vectors and corresponding responses:
S1 <- 1:2 # first support
beta1 <- numeric(p)
beta1[S1] <- 5
y1 <- X[, S1] %*% beta1[S1] + rnorm(n)
S2 <- 3:4 # second support
beta2 <- numeric(p)
beta2[S2] <- 5
y2 <- X[, S2] %*% beta2[S2] + rnorm(n)


## Monte Carlo simulation giving empirical distribution for the statistic P (see paper below):
qut.MC.output <-  qut.MC(X, parallel = FALSE, MCrep = 50)

## lasso-zero estimates:

## for y1 with alpha = 0.1:
lass01 <- lass0(X, y1, alpha = 0.1, qut.MC.output = qut.MC.output, parallel = FALSE)
plot(lass01)

## for y2 with alpha = 0.05:
lass02 <- lass0(X, y2, alpha = 0.05, qut.MC.output = qut.MC.output, parallel = FALSE)
plot(lass02)




