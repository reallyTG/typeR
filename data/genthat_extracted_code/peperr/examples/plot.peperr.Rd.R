library(peperr)


### Name: plot.peperr
### Title: Plot method for peperr object
### Aliases: plot.peperr
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
##D peperr.object1 <- peperr(response=Surv(time, status), x=x, 
##D    fit.fun=fit.CoxBoost, complexity=c(50, 75), 
##D    indices=resample.indices(n=length(time), method="sub632", sample.n=10))
##D plot(peperr.object1)
##D 
##D peperr.object2 <- peperr(response=Surv(time, status), x=x, 
##D    fit.fun=fit.CoxBoost, args.fit=list(penalty=100),
##D    complexity=complexity.mincv.CoxBoost, args.complexity=list(penalty=100),
##D    indices=resample.indices(n=length(time), method="sub632", sample.n=10),
##D    trace=TRUE)
##D plot(peperr.object2)
##D 
##D peperr.object3 <- peperr(response=Surv(time, status), x=x, 
##D    fit.fun=fit.CoxBoost, args.fit=list(penalty=100),
##D    complexity=complexity.mincv.CoxBoost, args.complexity=list(penalty=100),
##D    indices=resample.indices(n=length(time), method="sub632", sample.n=10),
##D    args.aggregation=list(times=seq(0, quantile(time, probs=0.9), length.out=100)),
##D    trace=TRUE)
##D plot(peperr.object3)
## End(Not run)



