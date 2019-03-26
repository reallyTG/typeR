library(kmconfband)


### Name: exact
### Title: Calculate an Exact Nonparametric Confidence Band for the
###   Survivor Function
### Aliases: exact

### ** Examples

## Calculate the exact, nonparametric lower and upper estimates of
## leukemia patient remission experience based on data from 20 patients 
## receiving Treatment B when the value of x is 0.3
time<-c(1,1,2,2,3,4,5,8,8,9,11,12,14,16,18,21,27,31,38,44)
status<-c(rep(1,16),0,1,0,1)
fit<-survfit(Surv(time,status)~1)
exact(fit,0.3)



