library(SharpeR)


### Name: sm_vcov
### Title: Compute variance covariance of 'Unified' Second Moment
### Aliases: sm_vcov
### Keywords: univar

### ** Examples

X <- matrix(rnorm(1000*3),ncol=3)
Sigmas <- sm_vcov(X)
Sigmas.n <- sm_vcov(X,vcov.func="normal")
Sigmas.n <- sm_vcov(X,fit.intercept=FALSE)

# make it fat tailed:
X <- matrix(rt(1000*3,df=5),ncol=3)
Sigmas <- sm_vcov(X)
## Not run: 
##D if (require(sandwich)) {
##D  Sigmas <- sm_vcov(X,vcov.func=vcovHC)
##D }
## End(Not run)
# add some autocorrelation to X
Xf <- filter(X,c(0.2),"recursive")
colnames(Xf) <- colnames(X)
Sigmas <- sm_vcov(Xf)
## Not run: 
##D if (require(sandwich)) {
##D Sigmas <- sm_vcov(Xf,vcov.func=vcovHAC)
##D }
## End(Not run)




