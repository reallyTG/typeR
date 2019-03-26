library(SemiCompRisks)


### Name: FreqSurv_HReg
### Title: The function to fit parametric Weibull models for the
###   frequentist analysis of univariate survival data.
### Aliases: FreqSurv_HReg
### Keywords: frequentist framework univariate analysis hazard regression
###   models

### ** Examples

## Not run: 
##D 	
##D # loading a data set	
##D data(survData)
##D 
##D form <- Formula(time + event ~ cov1 + cov2)
##D 
##D fit_WB <- FreqSurv_HReg(form, data=survData)
##D fit_WB
##D summ.fit_WB <- summary(fit_WB); names(summ.fit_WB)
##D summ.fit_WB
##D pred_WB <- predict(fit_WB, tseq=seq(from=0, to=30, by=5))
##D plot(pred_WB, plot.est="Haz")
##D plot(pred_WB, plot.est="Surv")
## End(Not run)



