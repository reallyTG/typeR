library(MixtureRegLTIC)


### Name: plotResidual
### Title: Estimate and Plot Empirical Distributions of Residuals in the
###   Fitted Regression Model
### Aliases: plotResidual

### ** Examples

data(simLTICdataA)

##### fit the logistic-AFT location-scale model for LTIC data
fit=MixtureLogitAFT(formula=Surv(time1,time2,status)~1,
    eventprobreg=~X1,locationreg=~X1,scalereg=~X1,
    var.entry="entry",data=simLTICdataA)

##### plot the empirical distribution of residuals
plot.res=plotResidual(fit)
legend(-9.5,1,legend=plot.res$legend,col=plot.res$col,lty=plot.res$lty,
       title=" Strata (Case / Total)")




