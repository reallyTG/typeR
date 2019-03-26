library(mixor)


### Name: BIC.mixor
### Title: Return BIC for a Fitted Mixor Model
### Aliases: BIC.mixor
### Keywords: methods

### ** Examples

library("mixor")
data("schizophrenia")
### Random intercept
SCHIZO1.fit<-mixor(imps79o ~ TxDrug + SqrtWeek + TxSWeek, data=schizophrenia, 
     id=id, link="probit")
summary(SCHIZO1.fit)
BIC(SCHIZO1.fit)



