library(risksetROC)


### Name: CoxWeights
### Title: Incident/Dynamic (I/D) ROC curve, AUC and integrated AUC (iAUC)
###   estimation of censored survival data
### Aliases: CoxWeights
### Keywords: survival

### ** Examples

library(MASS)
data(VA)
survival.time <- VA$stime
survival.status <- VA$status
score <- VA$Karn
cell.type <- factor(VA$cell )
tx <- as.integer( VA$treat==1 )
age <- VA$age
survival.status[VA$stime > 500 ] <- 0
survival.time[VA$stime > 500 ] <- 500
library(survival)
fit0 <- coxph( Surv(survival.time,survival.status)
        ~ score + cell.type + tx + age, na.action=na.omit )
summary(fit0)
eta <- fit0$linear.predictor
AUC <- NULL
out <- CoxWeights(marker=eta, Stime=survival.time, status=survival.status,
predict.time=30)
## to see how well the marker predicts one-month survival
AUC <- out$AUC



