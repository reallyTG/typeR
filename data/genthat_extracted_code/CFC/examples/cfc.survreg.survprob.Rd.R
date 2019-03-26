library(CFC)


### Name: cfc.survreg.survprob
### Title: Survival probability function for 'survreg' models
### Aliases: cfc.survreg.survprob

### ** Examples

## Not run: 
##D library("CFC") # for cfc
##D data(bmt)
##D library("randomForestSRC") # for rfsrc
##D library("survival") # for survreg
##D 
##D prep <- cfc.prepdata(Surv(time, cause) ~ platelet + age + tcell, bmt)
##D f1 <- prep$formula.list[[1]]
##D f2 <- prep$formula.list[[2]]
##D dat <- prep$dat
##D tmax <- prep$tmax
##D 
##D # building a parametric Weibull regression model
##D # for cause 1
##D reg1 <- survreg(f1, dat, x = TRUE) # must keep x for prediction
##D 
##D # building a random forest survival model for cause 2
##D reg2 <- rfsrc(f2, dat)
##D # implementing a continuous interface for the random forest
##D # survival function
##D rfsrc.survfunc <- function(t, args, n) {
##D   which.zero <- which(t < .Machine$double.eps)
##D   ret <- approx(args$time.interest, args$survival[n, ], t, rule = 2)$y
##D   ret[which.zero] <- 1.0
##D   return (ret)
##D }
##D 
##D # constructing function and argument list
##D f.list <- list(cfc.survreg.survprob, rfsrc.survfunc)
##D arg.list <- list(reg1, reg2)
##D 
##D # competing-risk analysis
##D tout <- seq(0.0, tmax, length.out = 10)
##D # increase rel.tol for higher accuracy
##D cfc.out <- cfc(f.list, arg.list, nrow(bmt), tout, rel.tol = 1e-3)
##D 
## End(Not run)



