library(mixor)


### Name: deviance.mixor
### Title: Return the deviance for a Fitted Mixor Model
### Aliases: deviance.mixor
### Keywords: methods

### ** Examples

library("mixor")
data("schizophrenia")
### Random intercept
SCHIZO1.fit<-mixor(imps79o ~ TxDrug + SqrtWeek + TxSWeek, data=schizophrenia, 
     id=id, link="probit")
summary(SCHIZO1.fit)
deviance(SCHIZO1.fit)



