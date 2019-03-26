library(gamlss)


### Name: loglogSurv
### Title: Log-Log Survival function plots for checking the tail behaviour
###   of the data
### Aliases: loglogSurv loglogSurv1 loglogSurv2 loglogSurv3 logSurv
### Keywords: distribution

### ** Examples

data(film90)
F90 <- film90$lborev1
op<-par(mfrow=c(3,1))
loglogSurv1(F90)
loglogSurv2(F90)
loglogSurv3(F90)
par(op)
loglogSurv(F90)

logSurv(F90)



