library(mixor)


### Name: print.mixor
### Title: Printing Mixor Model Fits
### Aliases: print.mixor
### Keywords: methods

### ** Examples

library("mixor")
data("schizophrenia")
### Random intercept
SCHIZO1.fit<-mixor(imps79o ~ TxDrug + SqrtWeek + TxSWeek, data=schizophrenia, 
     id=id, link="probit")
print(SCHIZO1.fit)
### Random intercept and slope	
SCHIZO2.fit<-mixor(imps79o ~ TxDrug + SqrtWeek + TxSWeek, data=schizophrenia, 
     id=id, which.random.slope=2, link="probit")
print(SCHIZO2.fit)



