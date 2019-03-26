library(refund)


### Name: rlrt.pfr
### Title: Likelihood Ratio Test and Restricted Likelihood Ratio Test for
###   inference of functional predictors
### Aliases: rlrt.pfr

### ** Examples


## Not run: 
##D ##################################################################
##D #########               DTI Data Example                 #########
##D ##################################################################
##D 
##D ##################################################################
##D # For more about this example, see Swihart et al. 2012
##D # Testing for Functional Effects
##D ##################################################################
##D 
##D ## load and reassign the data;
##D data(DTI2)
##D O  <- DTI2$pasat ## PASAT outcome
##D id <- DTI2$id    ## subject id
##D W1 <- DTI2$cca   ## Corpus Callosum
##D W2 <- DTI2$rcst  ## Right corticospinal
##D V  <- DTI2$visit ## visit
##D 
##D ## prep scalar covariate
##D visit.1.rest <- matrix(as.numeric(V > 1), ncol=1)
##D covar.in <- visit.1.rest
##D 
##D 
##D ## note there is missingness in the functional predictors
##D apply(is.na(W1), 2, mean)
##D apply(is.na(W2), 2, mean)
##D 
##D ## fit two univariate models, then one model with both functional predictors
##D pfr.obj.t1 <- pfr_old(Y = O, covariates=covar.in, funcs = list(W1),     subj = id, kz = 10, kb = 50)
##D pfr.obj.t2 <- pfr_old(Y = O, covariates=covar.in, funcs = list(W2),     subj = id, kz = 10, kb = 50)
##D pfr.obj.t3 <- pfr_old(Y = O, covariates=covar.in, funcs = list(W1, W2), subj = id, kz = 10, kb = 50)
##D 
##D ## plot the coefficient function and bounds
##D dev.new()
##D par(mfrow=c(2,2))
##D ran <- c(-2,.5)
##D matplot(cbind(pfr.obj.t1$BetaHat[[1]], pfr.obj.t1$Bounds[[1]]),
##D   type = 'l', lty = c(1,2,2), col = c(1,2,2), ylab = "BetaHat",
##D   main = "CCA", xlab="Location", ylim=ran)
##D abline(h=0, col="blue")
##D matplot(cbind(pfr.obj.t2$BetaHat[[1]], pfr.obj.t2$Bounds[[1]]),
##D   type = 'l', lty = c(1,2,2), col = c(1,2,2), ylab = "BetaHat",
##D   main = "RCST", xlab="Location", ylim=ran)
##D abline(h=0, col="blue")
##D matplot(cbind(pfr.obj.t3$BetaHat[[1]], pfr.obj.t3$Bounds[[1]]),
##D   type = 'l', lty = c(1,2,2), col = c(1,2,2), ylab = "BetaHat",
##D   main = "CCA  - mult.", xlab="Location", ylim=ran)
##D abline(h=0, col="blue")
##D matplot(cbind(pfr.obj.t3$BetaHat[[2]], pfr.obj.t3$Bounds[[2]]),
##D   type = 'l', lty = c(1,2,2), col = c(1,2,2), ylab = "BetaHat",
##D   main = "RCST - mult.", xlab="Location", ylim=ran)
##D abline(h=0, col="blue")
##D 
##D ## do some testing
##D t1 <- rlrt.pfr(pfr.obj.t1, "constancy")
##D t2 <- rlrt.pfr(pfr.obj.t2, "constancy")
##D t3 <- rlrt.pfr(pfr.obj.t3, "inclusion")
##D 
##D t1$test.stat
##D t1$p.val
##D 
##D t2$test.stat
##D t2$p.val
##D 
##D t3$test.stat
##D t3$p.val
##D 
##D 
##D ## do some testing with rlrt.pfr(); same as above but subj = NULL
##D pfr.obj.t1 <- pfr(Y = O, covariates=covar.in, funcs = list(W1),     subj = NULL, kz = 10, kb = 50)
##D pfr.obj.t2 <- pfr(Y = O, covariates=covar.in, funcs = list(W2),     subj = NULL, kz = 10, kb = 50)
##D pfr.obj.t3 <- pfr(Y = O, covariates=covar.in, funcs = list(W1, W2), subj = NULL, kz = 10, kb = 50)
##D 
##D t1 <- rlrt.pfr(pfr.obj.t1, "constancy")
##D t2 <- rlrt.pfr(pfr.obj.t2, "constancy")
##D t3 <- rlrt.pfr(pfr.obj.t3, "inclusion")
##D 
##D t1$test.stat
##D t1$p.val
##D 
##D t2$test.stat
##D t2$p.val
##D 
##D t3$test.stat
##D t3$p.val
## End(Not run)



