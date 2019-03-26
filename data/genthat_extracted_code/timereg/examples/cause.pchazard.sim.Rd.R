library(timereg)


### Name: cause.pchazard.sim
### Title: Simulation of Piecewise constant hazard models with two causes
###   (Cox).
### Aliases: cause.pchazard.sim
### Keywords: survival

### ** Examples

data(TRACE)

cox1 <- cox.aalen(Surv(time,status==9)~prop(vf)+prop(chf)+prop(wmi),
            data=TRACE,robust=0)
cox2 <-  cox.aalen(Surv(time,status==0)~prop(vf)+prop(chf)+prop(wmi),
            data=TRACE,robust=0)

X1 <- TRACE[,c("vf","chf","wmi")]
n <- 100000
xid <- sample(1:nrow(X1),n,replace=TRUE)
Z1 <- X1[xid,]
Z2 <- X1[xid,]
rr1 <- exp(as.matrix(Z1) %*% cox1$gamma)
rr2 <- exp(as.matrix(Z2) %*% cox2$gamma)

cumhaz1 <- cox1$cum
cumhaz2 <- cox2$cum
d <-  cause.pchazard.sim(cox1$cum,cox2$cum,rr1,rr2)
dd <- cbind(d,Z1)
sc1 <-   cox.aalen(Surv(time,status==1)~prop(vf)+prop(chf)+prop(wmi),
                  data=dd,robust=0)
cbind(sc1$gamma, cox1$gamma)
sc2 <-  cox.aalen(Surv(time,status==2)~prop(vf)+prop(chf)+prop(wmi),
                  data=dd,robust=0)
cbind(sc2$gamma, cox2$gamma)
par(mfrow=c(1,2))
plot(cox1); lines(sc1$cum,col=2)
plot(cox2$cum,type="l");
lines(sc2$cum,col=2)



