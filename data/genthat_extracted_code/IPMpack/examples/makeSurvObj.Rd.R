library(IPMpack)


### Name: makeSurvObj
### Title: Functions to build survival objects
### Aliases: makeSurvObj

### ** Examples

#generate data
dff <- generateData()
#make simple logistic regression survival object relating survival to size at t
sv1 <- makeSurvObj(dff, Formula=surv~size)
#assess fit for model with discrete environmental classes fitted
sv1 <- makeSurvObj(dff, Formula=surv~size+covariate)

#now specifying parameters and supplying no data
sv1 <- makeSurvObj(Formula = surv ~ size + covariate,coeff=c(1,1,1))




