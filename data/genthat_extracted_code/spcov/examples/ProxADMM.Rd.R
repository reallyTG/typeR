library(spcov)


### Name: ProxADMM
### Title: Solving penalized Frobenius problem.
### Aliases: ProxADMM
### Keywords: multivariate

### ** Examples

set.seed(1)
n <- 100
p <- 200
# generate a covariance matrix:
model <- GenerateCliquesCovariance(ncliques=4, cliquesize=p / 4, 1)

# generate data matrix with x[i, ] ~ N(0, model$Sigma):
x <- matrix(rnorm(n * p), ncol=p) %*% model$A
S <- var(x)

# compute sparse, positive covariance estimator:
P <- matrix(1, p, p)
diag(P) <- 0
lam <- 0.1
aa <- ProxADMM(S, 0.01, lam, P)



