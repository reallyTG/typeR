library(kmconfband)


### Name: confband
### Title: Compute an Exact Nonparametric Confidence Band for the
###   Population Survivor Function
### Aliases: confband
### Keywords: survival

### ** Examples

## Calculate a nonparametric, exact, 95% confidence band for leukemia 
## patient remission experience based on data from 20 patients 
## receiving Treatment B
time<-c(1,1,2,2,3,4,5,8,8,9,11,12,14,16,18,21,27,31,38,44)
status<-c(rep(1,16),0,1,0,1)
fit<-survfit(Surv(time,status)~1)
bands<-confband(fit)

## Separately display the 95% (default) lower and upper confidence 
## band values 
bands[,1]
bands[,2]

## Repeat the same calculations, but for 80% confidence
bands<-confband(fit,0.80)

## Display the lower and upper confidence band values separately
bands[,1]
bands[,2]



