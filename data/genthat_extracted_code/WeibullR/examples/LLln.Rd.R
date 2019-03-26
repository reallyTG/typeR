library(WeibullR)


### Name: LLln
### Title: Log Likelihood for log-normal fitted data, failures and
###   suspensions only
### Aliases: LLln
### Keywords: likelihood reliability

### ** Examples

failures<-c(90,96,30,49,82)
suspensions<-c(100,45,10)
fit<-lslr(getPPP(failures, suspensions),dist="lnorm")
LL<-LLln(failures, suspensions, fit[1], fit[2])



