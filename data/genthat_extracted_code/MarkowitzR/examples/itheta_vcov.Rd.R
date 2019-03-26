library(MarkowitzR)


### Name: itheta_vcov
### Title: Compute variance covariance of Inverse 'Unified' Second Moment
### Aliases: itheta_vcov
### Keywords: univar

### ** Examples

X <- matrix(rnorm(1000*3),ncol=3)
# putting in -X is idiomatic:
ism <- itheta_vcov(-X)
iSigmas.n <- itheta_vcov(-X,vcov.func="normal")
iSigmas.n <- itheta_vcov(-X,fit.intercept=FALSE)
# compute the marginal Wald test statistics:
qidx <- 2:ism$pp
wald.stats <- ism$mu[qidx] / sqrt(diag(ism$Ohat[qidx,qidx]))

# make it fat tailed:
X <- matrix(rt(1000*3,df=5),ncol=3)
ism <- itheta_vcov(X)
qidx <- 2:ism$pp
wald.stats <- ism$mu[qidx] / sqrt(diag(ism$Ohat[qidx,qidx]))
## Not run: 
##D if (require(sandwich)) {
##D  ism <- itheta_vcov(X,vcov.func=vcovHC)
##D  qidx <- 2:ism$pp
##D  wald.stats <- ism$mu[qidx] / sqrt(diag(ism$Ohat[qidx,qidx]))
##D }
## End(Not run)
# add some autocorrelation to X
Xf <- filter(X,c(0.2),"recursive")
colnames(Xf) <- colnames(X)
ism <- itheta_vcov(Xf)
qidx <- 2:ism$pp
wald.stats <- ism$mu[qidx] / sqrt(diag(ism$Ohat[qidx,qidx]))
## Not run: 
##D if (require(sandwich)) {
##D ism <- itheta_vcov(Xf,vcov.func=vcovHAC)
##D  qidx <- 2:ism$pp
##D  wald.stats <- ism$mu[qidx] / sqrt(diag(ism$Ohat[qidx,qidx]))
##D }
## End(Not run)



