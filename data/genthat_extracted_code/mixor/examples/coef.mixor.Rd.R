library(mixor)


### Name: coef.mixor
### Title: Extract Model Coefficients
### Aliases: coef.mixor
### Keywords: methods

### ** Examples

library("mixor")
data("schizophrenia")
### Random intercept model
SCHIZO1.fit<-mixor(imps79o ~ TxDrug + SqrtWeek + TxSWeek, data=schizophrenia, 
   id=id, link="probit")
coef(SCHIZO1.fit)



