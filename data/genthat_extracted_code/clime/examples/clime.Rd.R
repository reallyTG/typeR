library(clime)


### Name: clime
### Title: solve for the inverse matrix
### Aliases: clime
### Keywords: models multivariate

### ** Examples

## trivial example
n <- 50
p <- 5
X <- matrix(rnorm(n*p), nrow=n)
re.clime <- clime(X)

## tridiagonal matrix example
bandMat <- function(p, k) {
  cM <- matrix(rep(1:p, each=p), nrow=p, ncol=p)
  return((abs(t(cM)-cM)<=k)*1)
}
## tridiagonal Omega with diagonal 1 and off-diagonal 0.5
Omega <- bandMat(p, 1)*0.5
diag(Omega) <- 1
Sigma <- solve(Omega)
X <- matrix(rnorm(n*p), nrow=n)%*%chol(Sigma)
re.clime <- clime(X, standardize=FALSE, linsolver="simplex")
re.cv <- cv.clime(re.clime)
re.clime.opt <- clime(X, standardize=FALSE, re.cv$lambdaopt)

## Compare Frobenius norm loss
## clime estimator
sqrt( sum( (Omega-re.clime.opt$Omegalist[[1]])^2 ) )
## Not run: 0.3438533
## Sample covariance matrix inversed
sqrt( sum( ( Omega-solve(cov(X)*(1-1/n)) )^2 ) )
## Not run: 0.874041
sqrt( sum( ( Omega-solve(cov(X)) )^2 ) )
## Not run: 0.8224296



