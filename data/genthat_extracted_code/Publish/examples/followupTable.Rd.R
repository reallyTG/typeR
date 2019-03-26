library(Publish)


### Name: followupTable
### Title: Summary tables for a given followup time point.
### Aliases: followupTable

### ** Examples

library(survival)
data(pbc)
pbc$edema <- factor(pbc$edema,levels=c("0","0.5","1"),labels=c("0","0.5","1"))
pbc$sex <- factor(pbc$sex,levels=c("m","f"),labels=c("m","f"))
followupTable(Hist(time,status)~age+edema+sex,data=pbc,followup.time=1000)




