## ---- echo=TRUE, eval=FALSE----------------------------------------------
#  library(survival)
#  ?pbc

## ---- echo=TRUE, eval=TRUE, message=FALSE--------------------------------
library(survRM2)

D = rmst2.sample.data()
nrow(D)
head(D[,1:3])

## ---- echo=FALSE, eval=TRUE, fig.height=7, fig.width=7-------------------
plot(survfit(Surv(time, status)~arm, data=D), col=c("blue","red"), lwd=2, mark.time=F, xlab="Years",ylab="Probability")
legend("bottomleft", c("Placebo (arm=0)","D-penicillamine (arm=1)"), col=c("blue","red"), lwd=2)

## ---- echo=FALSE, eval=TRUE----------------------------------------------
fit=survfit(Surv(D$time[D$arm==1], D$status[D$arm==1])~1)
tau=10
tmp.xx=c(0, fit$time); tmp.yy=c(1, fit$surv) ;
idx=tmp.xx<=tau
y.tau = min(tmp.yy[idx])
xx=c(tmp.xx[idx],   tau)
yy=c(tmp.yy[idx], y.tau)  
x.step=sort(c(0, tmp.xx, tmp.xx))
y.step=rev(sort(c(1,1,tmp.yy, tmp.yy[-length(tmp.yy)])))

rmst=summary(fit, rmean=10)$table[5]

## ---- echo=FALSE, eval=TRUE, fig.height=7, fig.width=7-------------------
par(mfrow=c(1,2))

#--------
plot(fit, mark.time=F, xlab="Years",ylab="Probability",conf.int=F, lwd=2, main="Restricted mean survival time (RMST)", col="red", cex.main=0.8)
for (i in 1: (length(xx)-1)){  
polygon(c(xx[i], xx[i+1], xx[i+1], xx[i]), c(0, 0, yy[i+1], yy[i]), col="pink", density=80, angle=80, lwd=2)
}
lines(x.step, y.step, col="red", lwd=3) 
text(5,0.4, paste(round(rmst, digits=2),"years"), cex=0.9)
  
#--------
plot(fit, mark.time=F, xlab="Years",ylab="Probability", conf.int=F, lwd=2, main="Restricted mean time lost (RMTL)", col="red",cex.main=0.8)
for (i in 1: (length(xx)-1)){  
polygon(c(xx[i], xx[i+1], xx[i+1], xx[i]), c(yy[i], yy[i+1], 1,1), col="orange", density=80, angle=80, lwd=2)
}
lines(x.step, y.step, col="red", lwd=3) 
text(7,0.8, paste(round(tau-rmst, digits=2),"years"), cex=0.9)

## ---- echo=TRUE, eval=TRUE-----------------------------------------------
time   = D$time
status = D$status
arm    = D$arm

## ---- echo=TRUE, eval=FALSE----------------------------------------------
#  rmst2(time, status, arm, tau=10)

## ---- echo=TRUE, eval=FALSE----------------------------------------------
#  rmst2(time, status, arm)

## ---- echo=TRUE, eval=TRUE-----------------------------------------------
obj = rmst2(time, status, arm, tau=10)
print(obj)

## ---- echo=TRUE, eval=TRUE, fig.height=7, fig.width=7--------------------
plot(obj, xlab="Years", ylab="Probability")

## ---- echo=TRUE, eval=FALSE----------------------------------------------
#  rmst2(time, status, arm, tau=10, covariates=x)

## ---- echo=FALSE, eval=TRUE----------------------------------------------
x=D[,c(4,6,7)]

## ---- echo=TRUE, eval=TRUE-----------------------------------------------
x=D[,c(4,6,7)]
head(x)

## ---- echo=TRUE, eval=TRUE-----------------------------------------------
rmst2(time, status, arm, tau=10, covariates=x)

