library(MixtureRegLTIC)


### Name: printMixture
### Title: Print the Summary Table of Regression Results
### Aliases: printMixture

### ** Examples

data(simLTICdataA)

##### fit the logistic-AFT location-scale model for LTIC data
fit=MixtureLogitAFT(formula=Surv(time1,time2,status)~1,
    eventprobreg=~X1,locationreg=~X1,scalereg=~X1,
    var.entry="entry",data=simLTICdataA)

##### print regression results of the fitted model
printMixture(fit)




