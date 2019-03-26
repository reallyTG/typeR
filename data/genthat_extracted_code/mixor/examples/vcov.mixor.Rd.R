library(mixor)


### Name: vcov.mixor
### Title: Return Variance-Covariance Matrix for a Mixor Model Object
### Aliases: vcov.mixor
### Keywords: methods

### ** Examples

library("mixor")
data("schizophrenia")
### Random intercept
SCHIZO1.fit<-mixor(imps79o ~ TxDrug + SqrtWeek + TxSWeek, data=schizophrenia, 
     id=id, link="probit")
summary(SCHIZO1.fit)
vcov(SCHIZO1.fit)



