library(quantreg)


### Name: rq.fit.sfnc
### Title: Sparse Constrained Regression Quantile Fitting
### Aliases: rq.fit.sfnc
### Keywords: regression

### ** Examples

## An artificial example :
n <- 200
p <- 50
set.seed(17)
X <- rnorm(n*p)
X[abs(X) < 2.0] <- 0
X <- cbind(1,matrix(X,n,p))
y <- 0.5 * apply(X,1,sum) + rnorm(n) ## true beta = (0.5, 0.5, ...)
R <- rbind(diag(p+1), -diag(p+1))
r <- c(rep( 0, p+1), rep(-1, p+1))

sX <- as.matrix.csr(X)
sR <- as.matrix.csr(R)
try(rq.o <- rq.fit.sfnc(sX, y, sR, r)) #-> not enough tmp memory

(tmpmax <- floor(1e5 + exp(-12.1)*(sX@ia[p+1]-1)^2.35))
## now ok:
rq.o <- rq.fit.sfnc(sX, y, sR, r, control = list(tmpmax = tmpmax))



