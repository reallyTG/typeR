library(pec)


### Name: crps
### Title: Summarizing prediction error curves
### Aliases: crps ibs
### Keywords: survival

### ** Examples

set.seed(18713)
library(prodlim)
library(survival)
dat=SimSurv(100)
pmodel=coxph(Surv(time,status)~X1+X2,data=dat,x=TRUE,y=TRUE)
perror=pec(list(Cox=pmodel),Hist(time,status)~1,data=dat)

## cumulative prediction error
crps(perror,times=1) # between min time and 1
## same thing:
ibs(perror,times=1) # between min time and 1
crps(perror,times=1,start=0) # between 0 and 1
crps(perror,times=seq(0,1,.2),start=0) # between 0 and seq(0,1,.2)





