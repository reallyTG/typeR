library(peperr)


### Name: peperr
### Title: Parallelised Estimation of Prediction Error
### Aliases: peperr
### Keywords: models regression survival

### ** Examples

# Generate survival data with 10 informative covariates 
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
##D # A: R runs sequential or R is started on commandline with desired options 
##D # (for example using sfCluster: sfCluster -i --cpus=5)
##D # Example A1:
##D # Obtain prediction error estimate fitting a Cox proportional hazards model
##D # using CoxBoost 
##D # through 10 bootstrap samples 
##D # with fixed complexity 50 and 75
##D # and aggregate using prediction error curves (default setting)
##D 
##D peperr.object1 <- peperr(response=Surv(time, status), x=x, 
##D    fit.fun=fit.CoxBoost, complexity=c(50, 75), 
##D    indices=resample.indices(n=length(time), method="sub632", sample.n=10))
##D peperr.object1
##D 
##D # Diagnostic plots
##D plot(peperr.object1)
##D 
##D # Extraction of prediction error curves (.632+ prediction error estimate), 
##D # blue line corresponds to complexity 50, 
##D # red one to complexity 75
##D plot(peperr.object1$attribute,
##D    perr(peperr.object1)[1,], type="l", col="blue",
##D    xlab="Evaluation time points", ylab="Prediction error")
##D lines(peperr.object1$attribute, 
##D    perr(peperr.object1)[2,], col="red")
##D 
##D # Example A2:
##D # As Example A1, but
##D # with complexity selected through a cross-validation procedure
##D # and extra argument 'penalty' passed to fit function and complexity function
##D peperr.object2 <- peperr(response=Surv(time, status), x=x, 
##D    fit.fun=fit.CoxBoost, args.fit=list(penalty=100),
##D    complexity=complexity.mincv.CoxBoost, args.complexity=list(penalty=100),
##D    indices=resample.indices(n=length(time), method="sub632", sample.n=10),
##D    trace=TRUE)
##D peperr.object2
##D 
##D # Diagnostic plots
##D plot(peperr.object2)
##D 
##D # Example A3:
##D # As Example A2, but
##D # with extra argument 'times', specifying the evaluation times passed to aggregation.fun
##D # and seed, for reproducibility of results
##D # Note: set.seed() is required additional to argument 'seed', 
##D # as function 'resample.indices' is used in peperr call.
##D set.seed(123)
##D peperr.object3 <- peperr(response=Surv(time, status), x=x, 
##D    fit.fun=fit.CoxBoost, args.fit=list(penalty=100),
##D    complexity=complexity.mincv.CoxBoost, args.complexity=list(penalty=100),
##D    indices=resample.indices(n=length(time), method="sub632", sample.n=10),
##D    args.aggregation=list(times=seq(0, quantile(time, probs=0.9), length.out=100)),
##D    trace=TRUE, RNG="fixed", seed=321)
##D peperr.object3
##D 
##D # Diagnostic plots
##D plot(peperr.object3)
##D 
##D # B: R is started sequential, desired cluster options are given as arguments
##D # Example B1:
##D # As example A1, but using a socket cluster and 3 CPUs
##D peperr.object4 <- peperr(response=Surv(time, status), x=x, 
##D    fit.fun=fit.CoxBoost, complexity=c(50, 75), 
##D    indices=resample.indices(n=length(time), method="sub632", sample.n=10),
##D    parallel=TRUE, clustertype="SOCK", cpus=3)
## End(Not run)



