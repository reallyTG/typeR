library(risksetROC)


### Name: risksetAUC
### Title: Incident/Dynamic (I/D) ROC curve, AUC and integrated AUC (iAUC)
###   estimation of censored survival data
### Aliases: risksetAUC
### Keywords: survival

### ** Examples

library(MASS)
data(VA)
survival.time=VA$stime
survival.status=VA$status
score <- VA$Karn
cell.type <- factor(VA$cell)
tx <- as.integer( VA$treat==1 )
age <- VA$age
survival.status[survival.time>500 ] <- 0
survival.time[survival.time>500 ] <- 500
fit0 <- coxph( Surv(survival.time,survival.status)
        ~ score + cell.type + tx + age, na.action=na.omit )
eta <- fit0$linear.predictor
tmax=365
AUC.CC=risksetAUC(Stime=survival.time,
       status=survival.status, marker=eta, method="Cox", tmax=tmax); 




