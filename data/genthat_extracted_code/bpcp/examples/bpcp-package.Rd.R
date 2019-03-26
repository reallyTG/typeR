library(bpcp)


### Name: bpcp-package
### Title: Pointwise Confidence Intervals Associated with the Survival
###   Distribution for Right Censored Data
### Aliases: bpcp-package
### Keywords: package survival nonparametric

### ** Examples

data(leuk)
## since there are ties at time=6
## and the data are truncated to the nearest integer, use Delta=1
bfit<-bpcp(leuk$time,leuk$status,Delta=1)
## plot Kaplan-Meier and 95 pct Beta Product Confidence Intervals 
plot(bfit,xlab="time (weeks)")
## details
summary(bfit)
quantile(bfit)
StCI(bfit,2)



