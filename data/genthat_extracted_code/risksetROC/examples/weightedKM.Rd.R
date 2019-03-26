library(risksetROC)


### Name: weightedKM
### Title: Incident/Dynamic (I/D) ROC curve, AUC and integrated AUC (iAUC)
###   estimation of censored survival data
### Aliases: weightedKM
### Keywords: survival

### ** Examples

data(pbc)
## considering only randomized patients
pbc1 <- pbc[1:312,]
## create new censoring variable combine 0,1 as 0, 2 as 1
survival.status <- ifelse( pbc1$status==2, 1, 0)
survival.time <- pbc1$fudays
kout <- weightedKM(Stime=survival.time, status=survival.status)
KM.plot(kout$time,kout$survival)



