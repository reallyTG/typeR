library(refund)


### Name: ccb.fpc
### Title: Corrected confidence bands using functional principal components
### Aliases: ccb.fpc

### ** Examples


## Not run: 
##D data(cd4)
##D 
##D # obtain a subsample of the data with 25 subjects
##D set.seed(1236)
##D sample = sample(1:dim(cd4)[1], 25)
##D Y.sub = cd4[sample,]
##D 
##D # obtain a mixed-model based FPCA decomposition
##D Fit.MM = fpca.sc(Y.sub, var = TRUE, simul = TRUE)
##D 
##D # use iterated variance to obtain curve estimates and variances
##D Fit.IV = ccb.fpc(Y.sub, n.boot = 25, simul = TRUE)
##D 
##D # for one subject, examine curve estimates, pointwise and simultaneous itervals
##D EX = 2
##D EX.IV =  cbind(Fit.IV$Yhat[EX,],
##D       Fit.IV$Yhat[EX,] + 1.96 * sqrt(Fit.IV$diag.var[EX,]),
##D       Fit.IV$Yhat[EX,] - 1.96 * sqrt(Fit.IV$diag.var[EX,]),
##D       Fit.IV$Yhat[EX,] + Fit.IV$crit.val[EX] * sqrt(Fit.IV$diag.var[EX,]),
##D       Fit.IV$Yhat[EX,] - Fit.IV$crit.val[EX] * sqrt(Fit.IV$diag.var[EX,]))
##D 
##D EX.MM =  cbind(Fit.MM$Yhat[EX,],
##D       Fit.MM$Yhat[EX,] + 1.96 * sqrt(Fit.MM$diag.var[EX,]),
##D       Fit.MM$Yhat[EX,] - 1.96 * sqrt(Fit.MM$diag.var[EX,]),
##D       Fit.MM$Yhat[EX,] + Fit.MM$crit.val[EX] * sqrt(Fit.MM$diag.var[EX,]),
##D       Fit.MM$Yhat[EX,] - Fit.MM$crit.val[EX] * sqrt(Fit.MM$diag.var[EX,]))
##D 
##D # plot data for one subject, with curve and interval estimates
##D d = as.numeric(colnames(cd4))
##D plot(d[which(!is.na(Y.sub[EX,]))], Y.sub[EX,which(!is.na(Y.sub[EX,]))], type = 'o',
##D   pch = 19, cex=.75, ylim = range(0, 3400), xlim = range(d),
##D     xlab = "Months since seroconversion", lwd = 1.2, ylab = "Total CD4 Cell Count",
##D       main = "Est. & CI - Sampled Data")
##D 
##D matpoints(d, EX.IV, col = 2, type = 'l', lwd = c(2, 1, 1, 1, 1), lty = c(1,1,1,2,2))
##D matpoints(d, EX.MM, col = 4, type = 'l', lwd = c(2, 1, 1, 1, 1), lty = c(1,1,1,2,2))
##D 
##D legend("topright", c("IV Est", "IV PW Int", "IV Simul Int",
##D     expression(paste("MM - ", hat(theta), " Est", sep = "")),
##D     expression(paste("MM - ", hat(theta), " PW Int", sep = "")),
##D     expression(paste("MM - ", hat(theta), " Simul Int", sep = ""))),
##D     lty=c(1,1,2,1,1,2), lwd = c(2.5,.75,.75,2.5,.75,.75),
##D     col = c("red","red","red","blue","blue","blue"))
## End(Not run)



