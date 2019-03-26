library(MarkowitzR)


### Name: theta_vcov
### Title: Compute variance covariance of 'Unified' Second Moment
### Aliases: theta_vcov
### Keywords: univar

### ** Examples

X <- matrix(rnorm(1000*3),ncol=3)
Sigmas <- theta_vcov(X)
Sigmas.n <- theta_vcov(X,vcov.func="normal")
Sigmas.n <- theta_vcov(X,fit.intercept=FALSE)

# make it fat tailed:
X <- matrix(rt(1000*3,df=5),ncol=3)
Sigmas <- theta_vcov(X)
## Not run: 
##D if (require(sandwich)) {
##D  Sigmas <- theta_vcov(X,vcov.func=vcovHC)
##D }
## End(Not run)
# add some autocorrelation to X
Xf <- filter(X,c(0.2),"recursive")
colnames(Xf) <- colnames(X)
Sigmas <- theta_vcov(Xf)
## Not run: 
##D if (require(sandwich)) {
##D Sigmas <- theta_vcov(Xf,vcov.func=vcovHAC)
##D }
## End(Not run)




