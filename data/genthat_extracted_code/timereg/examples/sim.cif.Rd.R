library(timereg)


### Name: sim.cif
### Title: Simulation of output from Cumulative incidence regression model
### Aliases: sim.cif sim.cifs subdist pre.cifs
### Keywords: survival

### ** Examples

data(TRACE)

## Logit link for proportional odds model, using comp.risk to save time 
#' cif <-  prop.odds.subdist(Event(time,status)~vf+chf+wmi,data=TRACE,cause=9)
cif <-  comp.risk(Event(time,status)~const(vf)+const(chf)+const(wmi),
                  data=TRACE,cause=9,model="logistic2")
sim1 <- sim.cif(cif,500,data=TRACE)
#' cc <-  prop.odds.subdist(Event(time,status)~vf+chf+wmi,data=sim1,cause=1)
cc <-  comp.risk(Event(time,status)~const(vf)+const(chf)+const(wmi),
                  data=sim1,cause=1,model="logistic2")
cbind(cif$gamma,cc$gamma)

plot(cif) 
lines(cc$cum)

#################################################################
## Fine-Gray model model, using comp.risk to avoid dependcies
#################################################################
cif <-  comp.risk(Event(time,status)~const(vf)+const(chf)+const(wmi),
                  data=TRACE,cause=9)
sim1 <- sim.cif(cif,500,data=TRACE)
#' cc <-  crr 
cc <-  comp.risk(Event(time,status)~const(vf)+const(chf)+const(wmi),
                  data=sim1,cause=1)
cbind(cif$gamma,cc$gamma)
plot(cif) 
lines(cc$cum)

# data(TRACE)
#  mm <- model.matrix(~vf+chf+wmi,data=TRACE)[,-1]
#  library(cmprsk)
#  cif <-  crr(TRACE$time,TRACE$status,mm,failcode=9)
#  sim1 <- sim.cif(cif,10000,data=TRACE,Z=mm)
#  mms <- model.matrix(~vf+chf+wmi,data=sim1)[,-1]
#  #' cc <-  prop.odds.subdist(Event(time,status)~vf+chf+wmi,data=sim1,cause=1)
#  cif1 <-  crr(sim1$time,sim1$status,mms,failcode=1)
#  cbind(cif$coef,cif1$coef)
# 
################################################################
#  simulating several causes with specific cumulatives 
################################################################
data(bmt)
cif1 <-  comp.risk(Event(time,cause)~const(tcell)+const(age),
                  data=bmt,cause=1,model="logistic2")
cif2 <-  comp.risk(Event(time,cause)~const(tcell)+const(age),
                  data=bmt,cause=2,model="logistic2")

## must look at same time-scale
cifs <- pre.cifs(list(cif1,cif2))
plot(cifs[[1]]$cum,type="l")
lines(cifs[[2]]$cum,col=2)
legend("topleft",c("cause1","cause2"),lty=1,col=1:2)

 n <- 500
 sim1 <- sim.cif(cifs[[1]],n,data=bmt)
 Z <- sim1[,c("tcell","age")]
 sim2 <- sim.cif(cifs[[2]],n,data=bmt,Z=Z,drawZ=FALSE)
 ###
 rt <- rbinom(n,1,(sim1$F1tau+sim2$F1tau))
 rb <- rbinom(n,1,sim1$F1tau/(sim1$F1tau+sim2$F1tau))
 cause=ifelse(rb==1,1,2)
 time=ifelse(cause==1,sim1$timecause,sim2$timecause)
 cause <- rt*cause
 time[cause==0] <- tail(cifs[[1]]$cum[,1],1)

 bt <- data.frame(time=time,cause=cause,tcell=sim1$tcell,age=sim1$age)
 scif1 <-  comp.risk(Event(time,cause)~const(tcell)+const(age),
                   data=bt,cause=1,model="logistic2")
 scif2 <-  comp.risk(Event(time,cause)~const(tcell)+const(age),
                   data=bt,cause=2,model="logistic2")

 plot(scif1$cum,type="l")
 lines(scif2$cum,col=1,lty=2)
 legend("topleft",c("cause1","cause2"),lty=1:2,col=1:1)
 lines(cifs[[1]]$cum,col=2)
 lines(cifs[[2]]$cum,col=2,lty=2)

#  Everyhing wraped in a call assuming covariates work in the same way for two models
dd <- sim.cifs(list(cif1,cif2),2000,data=bmt)
scif1 <-  comp.risk(Event(time,cause)~const(tcell)+const(age),
                  data=dd,cause=1,model="logistic2")
scif2 <-  comp.risk(Event(time,cause)~const(tcell)+const(age),
                  data=dd,cause=2,model="logistic2")

plot(scif1$cum,type="l")
lines(scif2$cum,col=1,lty=2)
legend("topleft",c("cause1","cause2"),lty=1:2,col=1:1)
lines(cifs[[1]]$cum,col=2)
lines(cifs[[2]]$cum,col=2,lty=2)




