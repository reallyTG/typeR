library(mixor)


### Name: plot.mixor
### Title: Plot empirical Bayes estimates of random effects for a Mixor
###   Model Object
### Aliases: plot.mixor
### Keywords: methods

### ** Examples

library("mixor")
data("schizophrenia")
### Random intercept
SCHIZO1.fit<-mixor(imps79o ~ TxDrug + SqrtWeek + TxSWeek, data=schizophrenia, 
     id=id, link="probit")
plot(SCHIZO1.fit)



