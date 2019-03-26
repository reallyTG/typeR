library(peperr)


### Name: ipec
### Title: Integrated prediction error curve
### Aliases: ipec
### Keywords: models regression survival

### ** Examples

## Not run: 
##D n <- 200
##D p <- 100
##D beta <- c(rep(1,10),rep(0,p-10))
##D x <- matrix(rnorm(n*p),n,p)
##D real.time <- -(log(runif(n)))/(10*exp(drop(x %*% beta)))
##D cens.time <- rexp(n,rate=1/10)
##D status <- ifelse(real.time <= cens.time,1,0)
##D time <- ifelse(real.time <= cens.time,real.time,cens.time)
##D 
##D # Example:
##D # Obtain prediction error estimate fitting a Cox proportional hazards model
##D # using CoxBoost 
##D # through 10 bootstrap samples 
##D # with fixed complexity 50 and 75
##D # and aggregate using prediction error curves
##D peperr.object <- peperr(response=Surv(time, status), x=x, 
##D    fit.fun=fit.CoxBoost, complexity=c(50, 75), 
##D    indices=resample.indices(n=length(time), method="sub632", sample.n=10))
##D # 632+ estimate for both complexity values at each time point
##D prederr <- perr(peperr.object)
##D # Integrated prediction error curve for both complexity values
##D ipec(prederr, eval.times=peperr.object$attribute, response=Surv(time, status))
## End(Not run)



