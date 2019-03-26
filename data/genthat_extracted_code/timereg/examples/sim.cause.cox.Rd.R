library(timereg)


### Name: sim.cause.cox
### Title: Simulation of cause specific from Cox models.
### Aliases: sim.cause.cox
### Keywords: survival

### ** Examples


nsim <- 1000
data(bmt)
cox1 <- cox.aalen(Surv(time,cause==1)~prop(tcell)+prop(platelet),data=bmt,robust=0)
cox2 <- cox.aalen(Surv(time,cause==2)~prop(tcell)+prop(platelet),data=bmt,robust=0)
coxs <- list(cox1,cox2)
dd <- sim.cause.cox(coxs,nsim,data=bmt)
scox1 <- cox.aalen(Surv(time,status==1)~prop(tcell)+prop(platelet),data=dd,robust=0)
scox2 <- cox.aalen(Surv(time,status==2)~prop(tcell)+prop(platelet),data=dd,robust=0)
### 
cbind(cox1$gamma,scox1$gamma)
cbind(cox2$gamma,scox2$gamma)
par(mfrow=c(1,2))
plot(cox1); lines(scox1$cum,col=2)
plot(cox2$cum,type="l");
lines(scox2$cum,col=2)
          
          
## No test: 
### do not test to avoid dependence on mets
require(mets)          
data(bmt)
cox1 <- phreg(Surv(time,cause==1)~tcell+platelet,data=bmt)
cox2 <- phreg(Surv(time,cause==2)~tcell+platelet,data=bmt)
coxs <- list(cox1,cox2)
dd <- sim.cause.cox(coxs,nsim,data=bmt)
scox1 <- phreg(Surv(time,status==1)~tcell+platelet,data=dd)
scox2 <- phreg(Surv(time,status==2)~tcell+platelet,data=dd)
cbind(cox1$coef,scox1$coef)
cbind(cox2$coef,scox2$coef)
par(mfrow=c(1,2))
basehazplot.phreg(cox1); basehazplot.phreg(scox1,add=TRUE); 
basehazplot.phreg(cox2); basehazplot.phreg(scox2,add=TRUE); 

cox1 <- phreg(Surv(time,cause==1)~strata(tcell)+platelet,data=bmt)
cox2 <- phreg(Surv(time,cause==2)~strata(tcell)+platelet,data=bmt)
coxs <- list(cox1,cox2)
dd <- sim.cause.cox(coxs,nsim,data=bmt)
scox1 <- phreg(Surv(time,status==1)~strata(tcell)+platelet,data=dd)
scox2 <- phreg(Surv(time,status==2)~strata(tcell)+platelet,data=dd)
cbind(cox1$coef,scox1$coef)
cbind(cox2$coef,scox2$coef)
par(mfrow=c(1,2))
basehazplot.phreg(cox1); basehazplot.phreg(scox1,add=TRUE); 
basehazplot.phreg(cox2); basehazplot.phreg(scox2,add=TRUE); 

# coxph          
cox1 <- coxph(Surv(time,cause==1)~tcell+platelet,data=bmt)
cox2 <- coxph(Surv(time,cause==2)~tcell+platelet,data=bmt)
coxs <- list(cox1,cox2)
dd <- sim.cause.cox(coxs,nsim,data=bmt)
scox1 <- coxph(Surv(time,status==1)~tcell+platelet,data=dd)
scox2 <- coxph(Surv(time,status==2)~tcell+platelet,data=dd)
cbind(cox1$coef,scox1$coef)
cbind(cox2$coef,scox2$coef)
## End(No test)  



