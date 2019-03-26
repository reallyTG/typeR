library(quantreg)


### Name: rq.fit.sfn
### Title: Sparse Regression Quantile Fitting
### Aliases: rq.fit.sfn sfnMessage
### Keywords: regression

### ** Examples

## An artificial example :
n <- 200
p <- 50
set.seed(101)
X <- rnorm(n*p)
X[abs(X) < 2.0] <- 0
X <- cbind(1, matrix(X, n, p))
y <- 0.5 * apply(X,1,sum) + rnorm(n) ## true beta = (0.5, 0.5, ...)

sX <- as.matrix.csr(X)
try(rq.o <- rq.fit.sfn(sX, y)) #-> not enough tmp memory
(tmpmax <- floor(1e5 + exp(-12.1)*(sX@ia[p+1]-1)^2.35))
## now ok:
rq.o <- rq.fit.sfn(sX, y, control = list(tmpmax= tmpmax))



