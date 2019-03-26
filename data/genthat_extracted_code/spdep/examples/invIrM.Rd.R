library(spdep)


### Name: invIrM
### Title: Compute SAR generating operator
### Aliases: invIrM invIrW powerWeights
### Keywords: spatial

### ** Examples

nb7rt <- cell2nb(7, 7, torus=TRUE)
lw <- nb2listw(nb7rt, style="W")
e <- eigenw(lw)
set.seed(1)
x <- matrix(sample(rnorm(500*length(nb7rt))), nrow=length(nb7rt))
if (FALSE) {
# Only needed in some simulation settings where the input and
# output distributions must agree in all but autocorrelation
x <- apply(x, 2, scale)
st <- apply(x, 2, function(x) shapiro.test(x)$p.value)
x <- x[, (st > 0.2 & st < 0.8)]
x <- apply(x, 2, function(v) residuals(spautolm(v ~ 1, listw=lw,
 method="eigen", control=list(pre_eig=e, fdHess=FALSE))))
x <- apply(x, 2, scale)
}
res0 <- apply(invIrM(nb7rt, rho=0.0, method="chol",
 feasible=TRUE) %*% x, 2, function(x) var(x)/length(x))
res2 <- apply(invIrM(nb7rt, rho=0.2, method="chol",
 feasible=TRUE) %*% x, 2, function(x) var(x)/length(x))
res4 <- apply(invIrM(nb7rt, rho=0.4, method="chol",
 feasible=TRUE) %*% x, 2, function(x) var(x)/length(x))
res6 <- apply(invIrM(nb7rt, rho=0.6, method="chol",
 feasible=TRUE) %*% x, 2, function(x) var(x)/length(x))
res8 <- apply(invIrM(nb7rt, rho=0.8, method="chol",
 feasible=TRUE) %*% x, 2, function(x) var(x)/length(x))
res9 <- apply(invIrM(nb7rt, rho=0.9, method="chol",
 feasible=TRUE) %*% x, 2, function(x) var(x)/length(x))
plot(density(res9), col="red", xlim=c(-0.01, max(density(res9)$x)),
  ylim=range(density(res0)$y),
  xlab="estimated variance of the mean",
  main=expression(paste("Effects of spatial autocorrelation for different ",
    rho, " values")))
lines(density(res0), col="black")
lines(density(res2), col="brown")
lines(density(res4), col="green")
lines(density(res6), col="orange")
lines(density(res8), col="pink")
legend(c(-0.02, 0.01), c(7, 25),
 legend=c("0.0", "0.2", "0.4", "0.6", "0.8", "0.9"),
 col=c("black", "brown", "green", "orange", "pink", "red"), lty=1, bty="n")
## Not run: 
##D x <- matrix(rnorm(length(nb7rt)), ncol=1)
##D system.time(e <- invIrM(nb7rt, rho=0.9, method="chol", feasible=TRUE) %*% x)
##D system.time(e <- invIrM(nb7rt, rho=0.9, method="chol", feasible=NULL) %*% x)
##D system.time(e <- invIrM(nb7rt, rho=0.9, method="solve", feasible=TRUE) %*% x)
##D system.time(e <- invIrM(nb7rt, rho=0.9, method="solve", feasible=NULL) %*% x)
##D W <- as(nb2listw(nb7rt), "CsparseMatrix")
##D system.time(ee <- powerWeights(W, rho=0.9, X=x))
##D all.equal(e, as(ee, "matrix"), check.attributes=FALSE)
##D system.time(e <- invIrM(nb7rt, rho=0.98, method="solve", feasible=NULL) %*% x)
##D system.time(ee <- powerWeights(W, rho=0.98, X=x))
##D str(attr(ee, "internal"))
##D all.equal(e, as(ee, "matrix"), check.attributes=FALSE)
##D system.time(ee <- powerWeights(W, rho=0.98, order=1000, X=x))
##D all.equal(e, as(ee, "matrix"), check.attributes=FALSE)
##D nb60rt <- cell2nb(60, 60, torus=TRUE)
##D W <- as(nb2listw(nb60rt), "CsparseMatrix")
##D set.seed(1)
##D x <- matrix(rnorm(dim(W)[1]), ncol=1)
##D system.time(ee <- powerWeights(W, rho=0.3, X=x))
##D str(as(ee, "matrix"))
##D obj <- errorsarlm(as(ee, "matrix")[,1] ~ 1, listw=nb2listw(nb60rt), method="Matrix")
##D coefficients(obj)
## End(Not run)



