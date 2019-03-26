library(survivalMPL)


### Name: plot.coxph_mpl
### Title: Plot a coxph_mpl Object
### Aliases: plot.coxph_mpl
### Keywords: survival

### ** Examples

## Not run: 
##D data(lung)
##D fit_mpl <- coxph_mpl(Surv(time, status == 2) ~ age + sex + ph.karno + wt.loss, data = lung)
##D 
##D par(mfrow=c(2,2))
##D plot(fit_mpl, ask=FALSE, cex.main=.75)
## End(Not run)



