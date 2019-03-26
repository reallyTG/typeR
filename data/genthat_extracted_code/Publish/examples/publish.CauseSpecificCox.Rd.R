library(Publish)


### Name: publish.CauseSpecificCox
### Title: Tabulizing cause-specific hazard ratio from all causes with
###   confidence limits and Wald test p-values.
### Aliases: publish.CauseSpecificCox

### ** Examples

library(riskRegression)
library(prodlim)
library(pec)
library(survival)
data(Melanoma,package="riskRegression")
fit1 <- CSC(list(Hist(time,status)~sex,Hist(time,status)~invasion+epicel+age),
            data=Melanoma)
publish(fit1)
publish(fit1,pvalue.stars=TRUE)
publish(fit1,factor.reference="inline",units=list("age"="years"))



