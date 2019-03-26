library(risksetROC)


### Name: SchoenSmooth
### Title: Incident/Dynamic (I/D) ROC curve, AUC and integrated AUC (iAUC)
###   estimation of censored survival data
### Aliases: SchoenSmooth
### Keywords: survival

### ** Examples

data(pbc)
## considering only randomized patients
pbc1 <- pbc[1:312,]
## create new censoring variable combine 0,1 as 0, 2 as 1
survival.status <- ifelse( pbc1$status==2, 1, 0)
survival.time <- pbc1$fudays
pbc1$status1 <- survival.status
fit <- coxph( Surv(fudays,status1) ~ log(bili) +
                                     log(protime) +
                                     edema +
                                     albumin +
                                     age,
              data=pbc1 )
eta5 <- fit$linear.predictors
x <- eta5
nobs <- length(survival.time[survival.status==1])
span <- 1.5*(nobs^(-0.2))
fitCox5 <- coxph( Surv(survival.time,survival.status) ~ x )
bfnx1.1 <- SchoenSmooth( fit=fitCox5, Stime=survival.time, status=survival.status,
                       span=span, order=1)
bfnx1.0 <- SchoenSmooth( fit=fitCox5, Stime=survival.time, status=survival.status,
                       span=span, order=0)
plot(bfnx1.1$time, bfnx1.1$beta, type="l", xlab="Time", ylab="beta(t)")
lines(bfnx1.0$time, bfnx1.0$beta, lty=3)



