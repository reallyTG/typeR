library(mixor)


### Name: predict.mixor
### Title: Predict Outcome From Mixor Fitted Model
### Aliases: predict.mixor
### Keywords: methods

### ** Examples

library("mixor")
data("schizophrenia")
### Random intercept
SCHIZO1.fit<-mixor(imps79o ~ TxDrug + SqrtWeek + TxSWeek, data=schizophrenia, 
     id=id, link="probit")
pihat<-predict(SCHIZO1.fit)
table(pihat$class, schizophrenia$imps79o)
head(pihat$predicted)



