library(CoxBoost)


### Name: optimCoxBoostPenalty
### Title: Coarse line search for adequate penalty parameter
### Aliases: optimCoxBoostPenalty
### Keywords: models smooth regression

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
##D #  determine penalty parameter
##D 
##D optim.res <- optimCoxBoostPenalty(time=obs.time,status=status,x=x,
##D                                   trace=TRUE,start.penalty=500)
##D 
##D #   Fit with obtained penalty parameter and optimal number of boosting
##D #   steps obtained by cross-validation
##D 
##D cbfit <- CoxBoost(time=obs.time,status=status,x=x,
##D                   stepno=optim.res$cv.res$optimal.step,
##D                   penalty=optim.res$penalty) 
##D summary(cbfit)
##D 
## End(Not run)




