library(prodlim)


### Name: jackknife
### Title: Compute jackknife pseudo values.
### Aliases: jackknife jackknife.survival jackknife.competing.risks
### Keywords: survival

### ** Examples



## pseudo-values for survival models

d=SimSurv(20) 
f=prodlim(Hist(time,status)~1,data=d) 
jackknife(f,times=c(3,5))

## in some situations it may be useful to attach the
## the event time history to the result
jackknife(f,times=c(3,5),keepResponse=TRUE)

# pseudo-values for competing risk models
d=SimCompRisk(10) 
f=prodlim(Hist(time,event)~1,data=d) 
jackknife(f,times=c(3,10),cause=1)
jackknife(f,times=c(3,10,17),cause=2)




