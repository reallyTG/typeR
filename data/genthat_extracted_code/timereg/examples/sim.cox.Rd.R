library(timereg)


### Name: sim.cox
### Title: Simulation of output from Cox model.
### Aliases: sim.cox read.fit
### Keywords: survival

### ** Examples


data(TRACE)

cox <-  coxph(Surv(time,status==9)~vf+chf+wmi,data=TRACE)
sim1 <- sim.cox(cox,1000,data=TRACE)
cc <- coxph(Surv(time,status)~vf+chf+wmi,data=sim1)
cbind(cox$coef,cc$coef)

cor(sim1[,c("vf","chf","wmi")])
cor(TRACE[,c("vf","chf","wmi")])

cox <-  cox.aalen(Surv(time, status==9) ~ prop(vf)+prop(chf)+prop(wmi),TRACE,robust=0)
sim2 <- sim.cox(cox,1000,data=TRACE)
cc <-  cox.aalen(Surv(time, status)~prop(vf)+prop(chf)+prop(wmi),data=sim2,robust=0)
###
plot(cox)
lines(cc$cum,type="s",col=2)
cbind(cox$gamma,cc$gamma)

## No test: 
### do not test to avoid dependence on mets
require(mets)
cox <-  phreg(Surv(time, status==9)~vf+chf+wmi,data=TRACE)
sim3 <- sim.cox(cox,1000,data=TRACE)
cc <-  phreg(Surv(time, status)~vf+chf+wmi,data=sim3)
cbind(cox$coef,cc$coef)
basehazplot.phreg(cox,se=TRUE)
lines(cc$cumhaz,col=2)

cox <-  phreg(Surv(time,status==9)~strata(chf)+vf+wmi,data=TRACE)
sim3 <- sim.cox(cox,1000,data=TRACE)
cc <-   phreg(Surv(time, status)~strata(chf)+vf+wmi,data=sim3)
cbind(cox$coef,cc$coef)
basehazplot.phreg(cox)
basehazplot.phreg(cc,add=TRUE)
## End(No test)



