library(kmconfband)


### Name: iv
### Title: Initial Value Calculation for Deriving an Exact Nonparametric
###   Confidence Band for the Survivor Function
### Aliases: iv

### ** Examples

## Calculate an initial value from the exact null distribution of the 
## modified Berk-Jones statistic leading to an exact confidence band for 
## leukemia patient remission experience based on data from 20 patients 
## receiving Treatment B
time<-c(1,1,2,2,3,4,5,8,8,9,11,12,14,16,18,21,27,31,38,44)
status<-c(rep(1,16),0,1,0,1)
fit<-survfit(Surv(time,status)~1)
iv(fit)



