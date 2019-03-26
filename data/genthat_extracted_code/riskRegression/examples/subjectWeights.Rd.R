library(riskRegression)


### Name: subjectWeights
### Title: Estimation of censoring probabilities at subject specific times
### Aliases: subjectWeights subjectWeights.none subjectWeights.km
###   subjectWeights.marginal subjectWeights.nonpar subjectWeights.cox
###   subjectWeights.aalen
### Keywords: survival

### ** Examples


library(prodlim)
library(survival)
dat=SimSurv(300)

dat <- dat[order(dat$time,-dat$status),]

# using the marginal Kaplan-Meier for the censoring times

WKM=subjectWeights(Hist(time,status)~X2,data=dat,method="marginal")
plot(WKM$fit)
WKM$fit
WKM$weights

# using the Cox model for the censoring times given X2

WCox=subjectWeights(Surv(time,status)~X2,data=dat,method="cox")
WCox
plot(WCox$weights,WKM$weights)

# using the stratified Kaplan-Meier for the censoring times given X2

WKM2 <- subjectWeights(Surv(time,status)~X2,data=dat,method="nonpar")
plot(WKM2$fit,add=FALSE)





