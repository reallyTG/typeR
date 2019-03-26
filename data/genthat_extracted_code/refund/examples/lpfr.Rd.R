library(refund)


### Name: lpfr
### Title: Longitudinal penalized functional regression
### Aliases: lpfr

### ** Examples


## Not run: 
##D ##################################################################
##D # use longitudinal data to regress continuous outcomes on
##D # functional predictors (continuous outcomes only recorded for
##D # case == 1)
##D ##################################################################
##D 
##D data(DTI)
##D 
##D # subset data as needed for this example
##D cca = DTI$cca[which(DTI$case == 1),]
##D rcst = DTI$rcst[which(DTI$case == 1),]
##D DTI = DTI[which(DTI$case == 1),]
##D 
##D 
##D # note there is missingness in the functional predictors
##D apply(is.na(cca), 2, mean)
##D apply(is.na(rcst), 2, mean)
##D 
##D 
##D # fit two models with single functional predictors and plot the results
##D fit.cca = lpfr(Y=DTI$pasat, subj=DTI$ID, funcs = cca, smooth.cov=FALSE)
##D fit.rcst = lpfr(Y=DTI$pasat, subj=DTI$ID, funcs = rcst, smooth.cov=FALSE)
##D 
##D par(mfrow = c(1,2))
##D matplot(cbind(fit.cca$BetaHat[[1]], fit.cca$Bounds[[1]]),
##D   type = 'l', lty = c(1,2,2), col = c(1,2,2), ylab = "BetaHat",
##D   main = "CCA")
##D matplot(cbind(fit.rcst$BetaHat[[1]], fit.rcst$Bounds[[1]]),
##D   type = 'l', lty = c(1,2,2), col = c(1,2,2), ylab = "BetaHat",
##D   main = "RCST")
##D 
##D 
##D # fit a model with two functional predictors and plot the results
##D fit.cca.rcst = lpfr(Y=DTI$pasat, subj=DTI$ID, funcs = list(cca,rcst),
##D   smooth.cov=FALSE)
##D 
##D par(mfrow = c(1,2))
##D matplot(cbind(fit.cca.rcst$BetaHat[[1]], fit.cca.rcst$Bounds[[1]]),
##D   type = 'l', lty = c(1,2,2), col = c(1,2,2), ylab = "BetaHat",
##D   main = "CCA")
##D matplot(cbind(fit.cca.rcst$BetaHat[[2]], fit.cca.rcst$Bounds[[2]]),
##D   type = 'l', lty = c(1,2,2), col = c(1,2,2), ylab = "BetaHat",
##D   main = "RCST")
## End(Not run)



