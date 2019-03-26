library(SharpeR)


### Name: sr_vcov
### Title: Compute variance covariance of Sharpe Ratios.
### Aliases: sr_vcov
### Keywords: univar

### ** Examples

X <- matrix(rnorm(1000*3),ncol=3)
colnames(X) <- c("ABC","XYZ","WORM")
Sigmas <- sr_vcov(X)
# make it fat tailed:
X <- matrix(rt(1000*3,df=5),ncol=3)
Sigmas <- sr_vcov(X)
## Not run: 
##D if (require(sandwich)) {
##D Sigmas <- sr_vcov(X,vcov.func=vcovHC)
##D }
## End(Not run)
# add some autocorrelation to X
Xf <- filter(X,c(0.2),"recursive")
colnames(Xf) <- colnames(X)
Sigmas <- sr_vcov(Xf)
## Not run: 
##D if (require(sandwich)) {
##D Sigmas <- sr_vcov(Xf,vcov.func=vcovHAC)
##D }
## End(Not run)
# should run for a vector as well
X <- rnorm(1000)
SS <- sr_vcov(X)




