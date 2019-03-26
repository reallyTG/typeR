library(refund)


### Name: fpca.sc
### Title: Functional principal components analysis by smoothed covariance
### Aliases: fpca.sc

### ** Examples

## Not run: 
##D library(ggplot2)
##D library(reshape2)
##D data(cd4)
##D 
##D Fit.MM = fpca.sc(cd4, var = TRUE, simul = TRUE)
##D 
##D Fit.mu = data.frame(mu = Fit.MM$mu,
##D                     d = as.numeric(colnames(cd4)))
##D Fit.basis = data.frame(phi = Fit.MM$efunctions,
##D                        d = as.numeric(colnames(cd4)))
##D 
##D ## for one subject, examine curve estimate, pointwise and simultaneous itervals
##D EX = 1
##D EX.MM = data.frame(fitted = Fit.MM$Yhat[EX,],
##D            ptwise.UB = Fit.MM$Yhat[EX,] + 1.96 * sqrt(Fit.MM$diag.var[EX,]),
##D            ptwise.LB = Fit.MM$Yhat[EX,] - 1.96 * sqrt(Fit.MM$diag.var[EX,]),
##D            simul.UB = Fit.MM$Yhat[EX,] + Fit.MM$crit.val[EX] * sqrt(Fit.MM$diag.var[EX,]),
##D            simul.LB = Fit.MM$Yhat[EX,] - Fit.MM$crit.val[EX] * sqrt(Fit.MM$diag.var[EX,]),
##D            d = as.numeric(colnames(cd4)))
##D 
##D ## plot data for one subject, with curve and interval estimates
##D EX.MM.m = melt(EX.MM, id = 'd')
##D ggplot(EX.MM.m, aes(x = d, y = value, group = variable, color = variable, linetype = variable)) +
##D   geom_path() +
##D   scale_linetype_manual(values = c(fitted = 1, ptwise.UB = 2,
##D                         ptwise.LB = 2, simul.UB = 3, simul.LB = 3)) +
##D   scale_color_manual(values = c(fitted = 1, ptwise.UB = 2,
##D                      ptwise.LB = 2, simul.UB = 3, simul.LB = 3)) +
##D   labs(x = 'Months since seroconversion', y = 'Total CD4 Cell Count')
##D 
##D ## plot estimated mean function
##D ggplot(Fit.mu, aes(x = d, y = mu)) + geom_path() +
##D   labs(x = 'Months since seroconversion', y = 'Total CD4 Cell Count')
##D 
##D ## plot the first two estimated basis functions
##D Fit.basis.m = melt(Fit.basis, id = 'd')
##D ggplot(subset(Fit.basis.m, variable %in% c('phi.1', 'phi.2')), aes(x = d,
##D y = value, group = variable, color = variable)) + geom_path()
##D 
##D ## input a dataframe instead of a matrix
##D nid <- 20
##D nobs <- sample(10:20, nid, rep=TRUE)
##D ydata <- data.frame(
##D     .id = rep(1:nid, nobs),
##D     .index = round(runif(sum(nobs), 0, 1), 3))
##D ydata$.value <- unlist(tapply(ydata$.index,
##D                               ydata$.id,
##D                               function(x)
##D                                   runif(1, -.5, .5) +
##D                                   dbeta(x, runif(1, 6, 8), runif(1, 3, 5))
##D                               )
##D                        )
##D 
##D Fit.MM = fpca.sc(ydata=ydata, var = TRUE, simul = FALSE)
##D 
## End(Not run)



