library(mets)


### Name: gof.phreg
### Title: GOF for Cox PH regression
### Aliases: gof.phreg

### ** Examples

data(TRACE)

m1 <- phreg(Surv(time,status==9)~vf+chf+diabetes,data=TRACE) 
gg <- gof(m1)
par(mfrow=c(1,3))
plot(gg)

m1 <- phreg(Surv(time,status==9)~strata(vf)+chf+diabetes,data=TRACE) 
## to get Martingale ~ dN based simulations
gg <- gof(m1)

## to get Martingale robust simulations, specify cluster in  call 
m1 <- phreg(Surv(time,status==9)~chf+diabetes+cluster(id),data=TRACE) 
gg <- gof(m1)




