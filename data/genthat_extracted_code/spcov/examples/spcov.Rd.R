library(spcov)


### Name: spcov
### Title: Sparse Covariance Estimation
### Aliases: spcov
### Keywords: multivariate

### ** Examples

set.seed(1)
n <- 100
p <- 20
# generate a covariance matrix:
model <- GenerateCliquesCovariance(ncliques=4, cliquesize=p / 4, 1)

# generate data matrix with x[i, ] ~ N(0, model$Sigma):
x <- matrix(rnorm(n * p), ncol=p) %*% model$A
S <- var(x)

# compute sparse, positive covariance estimator:
step.size <- 100
tol <- 1e-3
P <- matrix(1, p, p)
diag(P) <- 0
lam <- 0.06
mm <- spcov(Sigma=S, S=S, lambda=lam * P,
            step.size=step.size, n.inner.steps=200,
            thr.inner=0, tol.outer=tol, trace=1)
sqrt(mean((mm$Sigma - model$Sigma)^2))
sqrt(mean((S - model$Sigma)^2))
## Not run: image(mm$Sigma!=0)



