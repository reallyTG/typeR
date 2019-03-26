library(gvcm.cat)


### Name: gvcm.cat.flex
### Title: Regularized Effects with Flexible Smoothing Parameters
### Aliases: gvcm.cat.flex

### ** Examples

## Not run: 
##D # compare gvcm.cat.flex and gvcm.cat for Lasso-type penalties:
##D n <- 100
##D ncov <- 7
##D set.seed(123)
##D X <- matrix(rnorm(n*ncov, sd=5), ncol=ncov)
##D coefs <- rpois(ncov + 1, 2)
##D y <- cbind(1, X) ##D 
##D data <- as.data.frame(cbind(y, X))
##D names(data) <- c("y", paste("x", 1:ncov, sep=""))
##D 
##D m1 <- gvcm.cat.flex(
##D whichCoefs = paste("x", 1:ncov, sep=""),
##D data=data,
##D indexNrCoefs=rep(1, ncov),
##D indexPenNorm=rep("L1", ncov),
##D indexPenA=list(1,1,1,1,1,1,1),
##D indexPenWeight=list(1,1,1,1,1,1,1)
##D )
##D 
##D m2 <- gvcm.cat(y ~ 1 + p(x1) + p(x2) + p(x3) + p(x4) + p(x5) + p(x6) + p(x7),
##D               data=data, tuning=list(lambda=m1$sp, specific=TRUE), start=rep(1, 8))
##D 
##D rbind(m1$coefficients, m2$coefficients)
##D 
##D # Lasso-type fusion penalty with gvcm.cat.flex
##D n <- 100
##D ncat <- 8
##D set.seed(567)
##D X <- t(rmultinom(n, 1, rep(1/ncat, ncat)))[, -1]
##D coefs <- c(rpois(1, 2), sort(rpois(ncat-1, 1)))
##D 
##D y <- cbind(1, X) ##D 
##D data <- as.data.frame(y)
##D data$x1 <- X
##D names(data) <- c("y", "x1")
##D 
##D A <- a(1:(ncat-1), ncat-2)
##D 
##D m3 <- gvcm.cat.flex(
##D whichCoefs = c("x1"),
##D data = data,
##D indexNrCoefs = c(ncat-1),
##D indexPenNorm = c("L1"),
##D indexPenA = list(A),
##D indexPenWeight = list(rep(1, ncol(A))),
##D tuning = 100 # fixed and large - in order to demonstrate the fusion of the coefficients
##D )
##D m3$coefficients
## End(Not run)



