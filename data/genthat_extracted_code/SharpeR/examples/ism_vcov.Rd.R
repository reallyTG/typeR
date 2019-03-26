library(SharpeR)


### Name: ism_vcov
### Title: Compute variance covariance of Inverse 'Unified' Second Moment
### Aliases: ism_vcov
### Keywords: univar

### ** Examples

X <- matrix(rnorm(1000*3),ncol=3)
# putting in -X is idiomatic:
ism <- ism_vcov(-X)
iSigmas.n <- ism_vcov(-X,vcov.func="normal")
iSigmas.n <- ism_vcov(-X,fit.intercept=FALSE)
# compute the marginal Wald test statistics:
ism.mu <- ism$mu[1:ism$p]
ism.Sg <- ism$Ohat[1:ism$p,1:ism$p]
wald.stats <- ism.mu / sqrt(diag(ism.Sg))

# make it fat tailed:
X <- matrix(rt(1000*3,df=5),ncol=3)
ism <- ism_vcov(X)
wald.stats <- ism$mu[1:ism$p] / sqrt(diag(ism$Ohat[1:ism$p,1:ism$p]))
## Not run: 
##D if (require(sandwich)) {
##D  ism <- ism_vcov(X,vcov.func=vcovHC)
##D  wald.stats <- ism$mu[1:ism$p] / sqrt(diag(ism$Ohat[1:ism$p,1:ism$p]))
##D }
## End(Not run)
# add some autocorrelation to X
Xf <- filter(X,c(0.2),"recursive")
colnames(Xf) <- colnames(X)
ism <- ism_vcov(Xf)
wald.stats <- ism$mu[1:ism$p] / sqrt(diag(ism$Ohat[1:ism$p,1:ism$p]))
## Not run: 
##D if (require(sandwich)) {
##D ism <- ism_vcov(Xf,vcov.func=vcovHAC)
##D  wald.stats <- ism$mu[1:ism$p] / sqrt(diag(ism$Ohat[1:ism$p,1:ism$p]))
##D }
## End(Not run)




