library(survivalMPL)


### Name: predict.coxph_mpl
### Title: Predictions for a Cox model
### Aliases: predict.coxph_mpl plot.predict.coxph_mpl
### Keywords: survival

### ** Examples

## Not run: 
##D data(lung)
##D fit_mpl <- coxph_mpl(Surv(time, status == 2) ~ age + sex + ph.karno + wt.loss, data = lung)
##D 
##D plot(predict(fit_mpl))
## End(Not run)



