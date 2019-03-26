library(relsurv)


### Name: summary.cmp.rel
### Title: Summary of the crude probability of death
### Aliases: summary.cmp.rel
### Keywords: survival

### ** Examples

data(slopop)
data(rdata)
#calculate the crude probability of death and summarize it
fit <- cmp.rel(Surv(time,cens)~sex,rmap=list(age=age*365),
      ratetable=slopop,data=rdata,tau=3652.41)
summary(fit,c(1,3),scale=365.241)



