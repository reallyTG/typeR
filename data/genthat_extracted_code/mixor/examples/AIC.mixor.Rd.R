library(mixor)


### Name: AIC.mixor
### Title: Return AIC for a Fitted Mixor Model
### Aliases: AIC.mixor
### Keywords: methods

### ** Examples

library("mixor")
data("schizophrenia")
### Random intercept
SCHIZO1.fit<-mixor(imps79o ~ TxDrug + SqrtWeek + TxSWeek, data=schizophrenia, 
     id=id, link="probit")
summary(SCHIZO1.fit)
AIC(SCHIZO1.fit)



