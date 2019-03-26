library(risksetROC)


### Name: llCoxReg
### Title: Incident/Dynamic (I/D) ROC curve, AUC and integrated AUC (iAUC)
###   estimation of censored survival data
### Aliases: llCoxReg
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
span <- 1.0*(nobs^(-0.2))

## Not run: 
##D bfnx1 <- llCoxReg(Stime=survival.time, status=survival.status, marker=x,
##D                    span=span, p=1)
##D plot(bfnx1$time, bfnx1$beta[,1], type="l", xlab="Time", ylab="beta(t)")
## End(Not run)



