library(CoxBoost)


### Name: optimStepSizeFactor
### Title: Coarse line search for optimum step-size modification factor
### Aliases: optimStepSizeFactor
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
##D #  Determine step-size modification factor. As there is no connection matrix,
##D #  perform search into both directions 
##D 
##D optim.res <- optimStepSizeFactor(direction="both",
##D                                 time=obs.time,status=status,x=x,
##D                                 trace=TRUE)
##D 
##D #   Fit with obtained step-size modification parameter and optimal number of boosting
##D #   steps obtained by cross-validation
##D 
##D cbfit <- CoxBoost(time=obs.time,status=status,x=x,
##D                   stepno=optim.res$optimal.step,
##D                   stepsize.factor=optim.res$optimal.factor) 
##D summary(cbfit)
##D 
## End(Not run)




