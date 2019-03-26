library(CoxBoost)


### Name: cv.CoxBoost
### Title: Determines the optimal number of boosting steps by
###   cross-validation
### Aliases: cv.CoxBoost
### Keywords: models regression survial

### ** Examples

## Not run: 
##D #   Generate some survival data with 10 informative covariates 
##D n <- 200; p <- 100
##D beta <- c(rep(1,10),rep(0,p-10))
##D x <- matrix(rnorm(n*p),n,p)
##D real.time <- -(log(runif(n)))/(10*exp(drop(x %*% beta)))
##D cens.time <- rexp(n,rate=1/10)
##D status <- ifelse(real.time <= cens.time,1,0)
##D obs.time <- ifelse(real.time <= cens.time,real.time,cens.time)
##D 
##D 
##D #  10-fold cross-validation
##D 
##D cv.res <- cv.CoxBoost(time=obs.time,status=status,x=x,maxstepno=500,
##D                       K=10,type="verweij",penalty=100) 
##D 
##D #   examine mean partial log-likelihood in the course of the boosting steps
##D plot(cv.res$mean.logplik)   
##D 
##D #   Fit with optimal number of boosting steps
##D 
##D cbfit <- CoxBoost(time=obs.time,status=status,x=x,stepno=cv.res$optimal.step,
##D                   penalty=100) 
##D summary(cbfit)
##D 
## End(Not run)




