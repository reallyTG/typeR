library(mets)


### Name: cif
### Title: Cumulative incidence with robust standard errors
### Aliases: cif

### ** Examples

data(TRACE)
TRACE$cluster <- sample(1:100,1878,replace=TRUE)
out1 <- cif(Event(time,status)~+1,data=TRACE,cause=9)
out2 <- cif(Event(time,status)~+1+cluster(cluster),data=TRACE,cause=9)

out1 <- cif(Event(time,status)~strata(vf,chf),data=TRACE,cause=9)
out2 <- cif(Event(time,status)~strata(vf,chf)+cluster(cluster),data=TRACE,cause=9)

par(mfrow=c(1,2))
bplot(out1,se=TRUE)
bplot(out2,se=TRUE)



