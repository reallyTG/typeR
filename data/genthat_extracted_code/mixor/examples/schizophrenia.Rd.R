library(mixor)


### Name: schizophrenia
### Title: National Institute of Mental Health Schizophrenia Collaborative
###   Study
### Aliases: schizophrenia
### Keywords: datasets

### ** Examples

library("mixor")
data("schizophrenia")
### Random intercept
SCHIZO1.fit<-mixor(imps79o ~ TxDrug + SqrtWeek + TxSWeek, data=schizophrenia, 
     id=id, link="probit")
summary(SCHIZO1.fit)
### Random intercept and slope	
SCHIZO2.fit<-mixor(imps79o ~ TxDrug + SqrtWeek + TxSWeek, data=schizophrenia, 
     id=id, which.random.slope=2, link="probit")
summary(SCHIZO2.fit)
# random intercept and trend with independent random effects; using logit link
SCHIZO3.fit<-mixor(imps79o ~ TxDrug + SqrtWeek + TxSWeek, data=schizophrenia, 
     id=id, which.random.slope=2, indep.re=TRUE, link="logit")
summary(SCHIZO3.fit)



