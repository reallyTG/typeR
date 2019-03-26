library(mixor)


### Name: logLik.mixor
### Title: Return the log-likelihood for a Fitted Mixor Model
### Aliases: logLik.mixor
### Keywords: methods

### ** Examples

library("mixor")
data("schizophrenia")
### Random intercept
SCHIZO1.fit<-mixor(imps79o ~ TxDrug + SqrtWeek + TxSWeek, data=schizophrenia, 
     id=id, link="probit")
summary(SCHIZO1.fit)
logLik(SCHIZO1.fit)



