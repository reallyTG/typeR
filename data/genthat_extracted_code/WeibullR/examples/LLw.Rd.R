library(WeibullR)


### Name: LLw
### Title: Log Likelihood for weibull fitted data, failures and suspensions
###   only
### Aliases: LLw
### Keywords: likelihood reliability

### ** Examples

failures<-c(90,96,30,49,82)
suspensions<-c(100,45,10)
fit<-lslr(getPPP(failures, suspensions))
LL<-LLw(failures, suspensions, fit[1], fit[2])



