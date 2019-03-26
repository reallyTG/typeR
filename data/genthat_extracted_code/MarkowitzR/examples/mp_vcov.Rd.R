library(MarkowitzR)


### Name: mp_vcov
### Title: Estimate Markowitz Portfolio
### Aliases: mp_vcov
### Keywords: univar

### ** Examples

set.seed(1001)
X <- matrix(rnorm(1000*3),ncol=3)
ism <- mp_vcov(X,fit.intercept=TRUE)
walds <- ism$W / sqrt(diag(ism$What))
print(t(walds))
# subspace constraint
Jmat <- matrix(rnorm(6),ncol=3)
ism <- mp_vcov(X,fit.intercept=TRUE,Jmat=Jmat)
walds <- ism$W / sqrt(diag(ism$What))
print(t(walds))
# hedging constraint
Gmat <- matrix(1,nrow=1,ncol=3)
ism <- mp_vcov(X,fit.intercept=TRUE,Gmat=Gmat)
walds <- ism$W / sqrt(diag(ism$What))

# now conditional expectation:

# generate data with given W, Sigma
Xgen <- function(W,Sigma,Feat) {
 Btrue <- Sigma %*% W
 Xmean <- Feat %*% t(Btrue)
 Shalf <- chol(Sigma)
 X <- Xmean + matrix(rnorm(prod(dim(Xmean))),ncol=dim(Xmean)[2]) %*% Shalf
}

n.feat <- 2
n.ret <- 8
n.obs <- 10000
set.seed(101)
Feat <- matrix(rnorm(n.obs * n.feat),ncol=n.feat)
Wtrue <- 10 * matrix(rnorm(n.feat * n.ret),ncol=n.feat)
Sigma <- cov(matrix(rnorm(100*n.ret),ncol=n.ret))
Sigma <- Sigma + diag(seq(from=1,to=3,length.out=n.ret))
X <- Xgen(Wtrue,Sigma,Feat)
ism <- mp_vcov(X,feat=Feat,fit.intercept=TRUE)
Wcomp <- cbind(0,Wtrue)
errs <- ism$W - Wcomp
dim(errs) <- c(length(errs),1)
Zerr <- solve(t(chol(ism$What)),errs)




