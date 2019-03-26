library(relsurv)


### Name: nessie
### Title: Net Expected Sample Size Is Estimated
### Aliases: nessie
### Keywords: survival

### ** Examples

data(slopop)
data(rdata)
rdata$agegr <-cut(rdata$age,seq(40,95,by=5))
nessie(Surv(time,cens)~agegr,rmap=list(age=age*365.241),
	ratetable=slopop,data=rdata,times=c(1,3,5,10,15))



