library(mets)


### Name: km
### Title: Kaplan-Meier with robust standard errors
### Aliases: km

### ** Examples

data(TRACE)
TRACE$cluster <- sample(1:100,1878,replace=TRUE)
out1 <- km(Surv(time,status==9)~strata(vf,chf),data=TRACE)
out2 <- km(Surv(time,status==9)~strata(vf,chf)+cluster(cluster),data=TRACE)

par(mfrow=c(1,2))
bplot(out1,se=TRUE)
bplot(out2,se=TRUE)



