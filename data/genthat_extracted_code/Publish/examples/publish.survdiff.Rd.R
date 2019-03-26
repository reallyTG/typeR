library(Publish)


### Name: publish.survdiff
### Title: Alternative summary of survdiff results
### Aliases: publish.survdiff

### ** Examples

library(survival)
data(pbc)
sd <- survdiff(Surv(time,status!=0)~sex,data=pbc)
publish(sd)
publish(sd,digits=c(3,2))




