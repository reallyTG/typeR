library(SemiCompRisks)


### Name: FreqID_HReg
### Title: The function to fit parametric Weibull models for the
###   frequentist anlaysis of semi-competing risks data.
### Aliases: FreqID_HReg
### Keywords: frequentist framework semi-competing risks analysis hazard
###   regression models

### ** Examples

## Not run: 
##D # loading a data set
##D data(scrData)
##D 
##D form <- Formula(time1 + event1 | time2 + event2 ~ x1 + x2 + x3 | x1 + x2 | x1 + x2)
##D 
##D fit_WB	<- FreqID_HReg(form, data=scrData, model="semi-Markov")
##D 
##D fit_WB
##D summ.fit_WB <- summary(fit_WB); names(summ.fit_WB)
##D summ.fit_WB
##D pred_WB <- predict(fit_WB, tseq=seq(from=0, to=30, by=5))
##D plot(pred_WB, plot.est="Haz")
##D plot(pred_WB, plot.est="Surv")
## End(Not run)



