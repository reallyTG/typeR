library(risksetROC)


### Name: IntegrateAUC
### Title: Incident/Dynamic (I/D) ROC curve, AUC and integrated AUC (iAUC)
###   estimation of censored survival data
### Aliases: IntegrateAUC
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
## first find the estimated survival probabilities at unique failure times
surv.prob <- unique(survfit(Surv(survival.time,survival.status)~1)$surv)
fit0 <- coxph( Surv(survival.time,survival.status)
        ~ score + cell.type + tx + age, na.action=na.omit )
eta <- fit0$linear.predictor
model.score <- eta

utimes <- unique( survival.time[ survival.status == 1 ] )
utimes <- utimes[ order(utimes) ]

## find AUC at unique failure times
AUC <- rep( NA, length(utimes) )
for( j in 1:length(utimes) )
{
out <- CoxWeights( eta, survival.time, survival.status,utimes[j])
AUC[j] <- out$AUC
}
## integrated AUC to get concordance measure
iAUC <- IntegrateAUC( AUC, utimes, surv.prob, tmax=365 )



