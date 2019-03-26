library(mev)


### Name: W.diag
### Title: Wadsworth's univariate and bivariate exponential threshold
###   diagnostics
### Aliases: W.diag

### ** Examples

## Not run: 
##D set.seed(123)
##D W.diag(rexp(1000), model="nhpp", k=30, q1=0)
##D # Parameter Stability only
##D W.diag(abs(rnorm(5000)), model="nhpp", k=30, q1=0, plots=c("PS"))
##D library(mvtnorm)
##D xbvn<-rmvnorm(6000, sigma=matrix(c(1,0.7,0.7,1),2,2))
##D # Transform margins to exponential manually
##D xbvn.exp<- -log(1-pnorm(xbvn))
##D W.diag(apply(xbvn.exp,1,min), model="exp", k=30, q1=0) #rate parametrization
##D W.diag(xbvn, model="exp", k=30, q1=0)
##D W.diag(apply(xbvn.exp,1,min), model="invexp", k=30, q1=0) #inverse rate parametrization
## End(Not run)
## Not run: 
##D library(ismev)
##D data(rain)
##D u <- quantile(rain, seq(0.85,0.99,by=0.01))
##D W.diag(xdat=rain, u=u, plots="PS")
## End(Not run)



