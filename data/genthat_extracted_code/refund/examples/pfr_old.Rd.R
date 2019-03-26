library(refund)


### Name: pfr_old
### Title: Penalized Functional Regression (old version)
### Aliases: pfr_old

### ** Examples

## Not run: 
##D ##################################################################
##D #########               DTI Data Example                 #########
##D ##################################################################
##D 
##D ##################################################################
##D # For more about this example, see Swihart et al. 2013
##D ##################################################################
##D 
##D ## load and reassign the data;
##D data(DTI2)
##D Y  <- DTI2$pasat ## PASAT outcome
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
##D ## fit two univariate models
##D pfr.obj.t1 <- pfr(Y = Y, covariates=covar.in, funcs = list(W1),     subj = id, kz = 10, kb = 50)
##D pfr.obj.t2 <- pfr(Y = Y, covariates=covar.in, funcs = list(W2),     subj = id, kz = 10, kb = 50)
##D 
##D ### one model with two functional predictors using "smooth.face"
##D ###  for smoothing predictors
##D pfr.obj.t3 <- pfr(Y = Y, covariates=covar.in, funcs = list(W1, W2), 
##D                   subj = id, kz = 10, kb = 50, nbasis=35,smooth.option="fpca.face")
##D 
##D ## plot the coefficient function and bounds
##D dev.new()
##D par(mfrow=c(2,2))
##D ran <- c(-2,.5)
##D matplot(cbind(pfr.obj.t1$BetaHat[[1]], pfr.obj.t1$Bounds[[1]]),
##D         type = 'l', lty = c(1,2,2), col = c(1,2,2), ylab = "BetaHat", 
##D         main = "CCA", xlab="Location", ylim=ran)
##D abline(h=0, col="blue")
##D matplot(cbind(pfr.obj.t2$BetaHat[[1]], pfr.obj.t2$Bounds[[1]]),
##D         type = 'l', lty = c(1,2,2), col = c(1,2,2), ylab = "BetaHat", 
##D         main = "RCST", xlab="Location", ylim=ran)
##D abline(h=0, col="blue")
##D matplot(cbind(pfr.obj.t3$BetaHat[[1]], pfr.obj.t3$Bounds[[1]]),
##D         type = 'l', lty = c(1,2,2), col = c(1,2,2), ylab = "BetaHat", 
##D         main = "CCA  - mult.", xlab="Location", ylim=ran)
##D abline(h=0, col="blue")
##D matplot(cbind(pfr.obj.t3$BetaHat[[2]], pfr.obj.t3$Bounds[[2]]),
##D         type = 'l', lty = c(1,2,2), col = c(1,2,2), ylab = "BetaHat", 
##D         main = "RCST - mult.", xlab="Location", ylim=ran)
##D abline(h=0, col="blue")
##D 
##D 
##D ##################################################################
##D # use baseline data to regress continuous outcomes on functional 
##D # predictors (continuous outcomes only recorded for case == 1)
##D ##################################################################
##D 
##D data(DTI)
##D 
##D # subset data as needed for this example
##D cca = DTI$cca[which(DTI$visit ==1 & DTI$case == 1),]
##D rcst = DTI$rcst[which(DTI$visit ==1 & DTI$case == 1),]
##D DTI = DTI[which(DTI$visit ==1 & DTI$case == 1),]
##D # note there is missingness in the functional predictors
##D apply(is.na(cca), 2, mean)
##D apply(is.na(rcst), 2, mean)
##D 
##D # fit two models with single functional predictors and plot the results
##D fit.cca = pfr(Y=DTI$pasat, funcs = cca, kz=10, kb=50, nbasis=20)
##D fit.rcst = pfr(Y=DTI$pasat, funcs = rcst, kz=10, kb=50, nbasis=20)
##D 
##D par(mfrow = c(1,2))
##D matplot(cbind(fit.cca$BetaHat[[1]], fit.cca$Bounds[[1]]),
##D         type = 'l', lty = c(1,2,2), col = c(1,2,2), ylab = "BetaHat", 
##D         main = "CCA")
##D matplot(cbind(fit.rcst$BetaHat[[1]], fit.rcst$Bounds[[1]]),
##D         type = 'l', lty = c(1,2,2), col = c(1,2,2), ylab = "BetaHat", 
##D         main = "RCST")
##D 
##D # fit a model with two functional predictors and plot the results
##D fit.cca.rcst = pfr(Y=DTI$pasat, funcs = list(cca, rcst), kz=10, kb=30, nbasis=20)
##D 
##D par(mfrow = c(1,2))
##D matplot(cbind(fit.cca.rcst$BetaHat[[1]], fit.cca.rcst$Bounds[[1]]),
##D         type = 'l', lty = c(1,2,2), col = c(1,2,2), ylab = "BetaHat", 
##D         main = "CCA")
##D matplot(cbind(fit.cca.rcst$BetaHat[[2]], fit.cca.rcst$Bounds[[2]]),
##D         type = 'l', lty = c(1,2,2), col = c(1,2,2), ylab = "BetaHat", 
##D         main = "RCST")
##D 
##D ##################################################################
##D # use baseline data to regress binary case-status outcomes on 
##D # functional predictors
##D ##################################################################
##D 
##D data(DTI)
##D 
##D # subset data as needed for this example
##D cca = DTI$cca[which(DTI$visit == 1),]
##D rcst = DTI$rcst[which(DTI$visit == 1),]
##D DTI = DTI[which(DTI$visit == 1),]
##D 
##D # fit two models with single functional predictors and plot the results
##D fit.cca = pfr(Y=DTI$case, funcs = cca, family = "binomial")
##D fit.rcst = pfr(Y=DTI$case, funcs = rcst, family = "binomial")
##D 
##D par(mfrow = c(1,2))
##D matplot(cbind(fit.cca$BetaHat[[1]], fit.cca$Bounds[[1]]),
##D         type = 'l', lty = c(1,2,2), col = c(1,2,2), ylab = "BetaHat", 
##D         main = "CCA")
##D matplot(cbind(fit.rcst$BetaHat[[1]], fit.rcst$Bounds[[1]]),
##D         type = 'l', lty = c(1,2,2), col = c(1,2,2), ylab = "BetaHat", 
##D         main = "RCST")
##D 
##D ##################################################################
##D #########              Octane Data Example               #########
##D ##################################################################
##D 
##D data(gasoline)
##D Y = gasoline$octane
##D funcs = gasoline$NIR
##D wavelengths = as.matrix(2*450:850)
##D 
##D # fit the model using pfr and the smoothing option "fpca.face"
##D fit = pfr(Y=Y, funcs=funcs, kz=15, kb=50,nbasis=35,smooth.option="fpca.face")
##D 
##D matplot(wavelengths, cbind(fit$BetaHat[[1]], fit$Bounds[[1]]), 
##D         type='l', lwd=c(2,1,1), lty=c(1,2,2), xlab = "Wavelengths", 
##D         ylab = "Coefficient Function", col=1)
## End(Not run)



