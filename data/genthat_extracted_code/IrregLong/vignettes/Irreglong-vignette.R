## ----results='hide',message=FALSE, warning=FALSE-------------------------
library(IrregLong)
library(MEMSS)
library(survival)
library(geepack)
library(frailtypack)

## ------------------------------------------------------------------------
data(Phenobarb)
Phenobarb$id <- as.numeric(Phenobarb$Subject)
Phenobarb$event <- as.numeric(is.finite(Phenobarb$conc))
Phenobarb.conc <- Phenobarb[is.finite(Phenobarb$conc),]
head(Phenobarb.conc)

## ------------------------------------------------------------------------
i <- iiw.weights(Surv(time.lag,time,event)~Wt + Apgar + I(conc.lag>0) + conc.lag +
      cluster(Subject),id="Subject",time="time",event="event",data=Phenobarb.conc,
      invariant="Subject",lagvars=c("time","conc"),maxfu=NULL,lagfirst=0,first=FALSE)
i$m

## ------------------------------------------------------------------------
i <- iiw.weights(Surv(time.lag,time,event)~Wt + ApgarInd + I(conc.lag>0) + conc.lag + 
      cluster(Subject),id="Subject",time="time",event="event",data=Phenobarb.conc,
      invariant="Subject",lagvars=c("time","conc"),maxfu=NULL,lagfirst=0,first=FALSE)
i$m
i <- iiw.weights(Surv(time.lag,time,event)~ApgarInd + I(conc.lag>0) + conc.lag + 
      cluster(Subject),id="Subject",time="time",event="event",data=Phenobarb.conc,
      invariant="Subject",lagvars=c("time","conc"),maxfu=NULL,lagfirst=0,first=FALSE)
i$m
i <- iiw.weights(Surv(time.lag,time,event)~I(conc.lag>0) + conc.lag + 
      cluster(Subject),id="Subject",time="time",event="event",data=Phenobarb.conc,
      invariant="Subject",lagvars=c("time","conc"),maxfu=NULL,lagfirst=0,first=FALSE)
i$m

## ----fig3, fig.height=6, fig.width=6, fig.align="center"-----------------
plot(Phenobarb$time,Phenobarb$conc,xlim=c(0,200),pch=16)

## ------------------------------------------------------------------------
rsq1 <- array(dim=8)
rsq1[1] <- summary(lm(conc~time,data=Phenobarb.conc))$adj.r.squared
rsq1[2] <- summary(lm(conc~I((time)^0.5),data=Phenobarb.conc))$adj.r.squared
rsq1[3] <- summary(lm(conc~I((time)^2),data=Phenobarb.conc))$adj.r.squared
rsq1[4] <- summary(lm(conc~I((time)^3),data=Phenobarb.conc))$adj.r.squared
rsq1[5] <- summary(lm(conc~log(time),data=Phenobarb.conc))$adj.r.squared
rsq1[6] <- summary(lm(conc~I((time)^(-0.5)),data=Phenobarb.conc))$adj.r.squared
rsq1[7] <- summary(lm(conc~I((time)^(-1)),data=Phenobarb.conc))$adj.r.squared
rsq1[8] <- summary(lm(conc~I((time)^(-2)),data=Phenobarb.conc))$adj.r.squared
which.max(rsq1)
rsq1[which.max(rsq1)]

## ------------------------------------------------------------------------
rsq2 <- array(dim=8)
rsq2[1] <- summary(lm(conc~log(time)+ time,data=Phenobarb.conc))$adj.r.squared
rsq2[2] <- summary(lm(conc~log(time)+ I((time)^0.5),data=Phenobarb.conc))$adj.r.squared
rsq2[3] <- summary(lm(conc~log(time) + I((time)^2),data=Phenobarb.conc))$adj.r.squared
rsq2[4] <- summary(lm(conc~log(time)+ I((time)^3),data=Phenobarb.conc))$adj.r.squared
rsq2[5] <- summary(lm(conc~log(time)+ time:log(time),data=Phenobarb.conc))$adj.r.squared
rsq2[6] <- summary(lm(conc~log(time) + I((time)^(-0.5))*log(1+time),data=Phenobarb.conc))$adj.r.squared
rsq2[7] <- summary(lm(conc~log(time) + I((time)^(-1)),data=Phenobarb.conc))$adj.r.squared
rsq2[8] <- summary(lm(conc~log(time)+ I((time)^(-2)),data=Phenobarb.conc))$adj.r.squared
which.max(rsq2)
rsq2[which.max(rsq2)]

## ------------------------------------------------------------------------
iiwgee <- iiwgee(conc ~ I(time^3) + log(time),Surv(time.lag,time,event)~I(conc.lag>0) + conc.lag + cluster(id),
        formulanull=NULL,id="id",time="time",event="event",data=Phenobarb.conc,
        invariant="id",lagvars=c("time","conc"),maxfu=NULL,lagfirst=0,first=TRUE)


## ------------------------------------------------------------------------
summary(iiwgee$geefit)

## ------------------------------------------------------------------------
i <- iiw.weights(Surv(time.lag,time,event)~I(conc.lag>0) + conc.lag + 
      cluster(Subject),id="id",time="time",event="event",data=Phenobarb.conc,
      invariant="Subject",lagvars=c("time","conc"),maxfu=NULL,lagfirst=0,first=TRUE)
Phenobarb.conc$weight[order(Phenobarb.conc$id)] <- i$iiw.weight
mw <- geeglm(conc ~ I(time^3) + log(time) , id=Subject, data=Phenobarb.conc, weights=weight)
summary(mw)

## ----fig2, fig.height=6, fig.width=6, fig.align="center"-----------------
m <- geeglm(conc ~ I(time^3) + log(time) , id=Subject, data=Phenobarb)
time <- (1:200)
unweighted <- cbind(rep(1,200),time^3,log(time))%*%m$coefficients
weighted <- cbind(rep(1,200),time^3,log(time))%*%iiwgee$geefit$coefficients
plot(Phenobarb$time,Phenobarb$conc,xlim=c(0,200),pch=16,xlab="Time",ylab="Serum phenobarbital concentration")
lines(time,unweighted,type="l")
lines(time,weighted,col=2)
legend (0,60,legend=c("Unweighted","Inverse-intensity weighted"),col=1:2,bty="n",lty=1)

## ------------------------------------------------------------------------
summary(iiwgee$phfit)

## ----results='hide',message=FALSE, eval=FALSE----------------------------
#  library(geesmv)
#  data(Phenobarb)
#  Phenobarb$id <- as.numeric(Phenobarb$Subject)
#  Phenobarb$event <- as.numeric(is.finite(Phenobarb$conc))
#  Phenobarb.conc <- Phenobarb[is.finite(Phenobarb$conc),]
#  i <- iiw.weights(Surv(time.lag,time,event)~I(conc.lag>0) + conc.lag +
#        cluster(id),id="id",time="time",event="event",data=Phenobarb.conc,
#        invariant="id",lagvars=c("time","conc"),maxfu=NULL,lagfirst=0,first=FALSE,frailty=FALSE)
#  reg <- function(data){
#    est <- geeglm(conc~I(time^3) + log(time), id=id,data=data)$coefficients
#    est <- cbind(est,GEE.var.md(conc~I(time^3) + log(time), id=id,data=data)$cov.beta)
#    est <- data.matrix(est)
#    return(est)
#  }
#  set.seed(301031)
#  m.mogee <- mo(20,reg,Phenobarb.conc,i$iiw.weight, singleobs=FALSE,id="id",time="time",keep.first=FALSE,var=TRUE)
#  m.mogee

## ----results='hide',message=FALSE----------------------------------------
data(Phenobarb)
Phenobarb$id <- as.numeric(Phenobarb$Subject)
Phenobarb$event <- as.numeric(is.finite(Phenobarb$conc))
Phenobarb.conc <- Phenobarb[is.finite(Phenobarb$conc),]
i <- iiw.weights(Surv(time.lag,time,event)~I(conc.lag>0) + conc.lag + 
        cluster(id),id="id",time="time",event="event",data=Phenobarb.conc,
        invariant="id",lagvars=c("time","conc"),maxfu=NULL,lagfirst=0,first=FALSE,
        frailty=TRUE)
summary(i$iiw.weight)
sum(i$iiw.weight>15)
Liangmo <- function(data,Yname,Xnames,Wnames,maxfu,baseline){
 x <- Liang(data,Yname,Xnames,Wnames,id="id",time="time",maxfu,baseline); print(x); return(x)
}
Phenobarb.conc$Intercept <- 1
Phenobarb.conc$time3 <- Phenobarb.conc$time^3
Phenobarb.conc$logtime <- log(Phenobarb.conc$time)
Phenobarb.conc$ApgarInd.time3 <- as.numeric(Phenobarb.conc$ApgarInd)*(Phenobarb.conc$time^3)
Phenobarb.conc$ApgarInd.logtime <- as.numeric(Phenobarb.conc$ApgarInd)*log(Phenobarb.conc$time)
weightstrunc <- i$iiw.weight
weightstrunc[weightstrunc>15] <- 15
set.seed(301031)
m.moLiang <- mo(20,Liangmo,Phenobarb.conc,weightstrunc, 
        singleobs=FALSE,id="id",time="time",keep.first=FALSE,var=FALSE,Yname="conc",
        Xnames=c("ApgarInd","ApgarInd.time3","ApgarInd.logtime"), 
        Wnames=c("Intercept"),maxfu=1000,baseline=0)

## ------------------------------------------------------------------------
m.moLiang$est

## ----fig4, fig.height=6, fig.width=6, fig.align="center"-----------------
miiwgee <- geeglm(conc ~ ApgarInd *(time3 + log(time)),id=id,weight=weightstrunc,data=Phenobarb.conc)

summary(miiwgee)
time <- (1:200)
gp0 <- cbind(rep(1,200),time^3,log(time))%*%miiwgee$coefficients[c(1,3:4)]
gp1 <- cbind(rep(1,200),time^3,log(time))%*%(miiwgee$coefficients[c(2,5:6)] + miiwgee$coefficients[c(1,3:4)])
diffLiang <- cbind(rep(1,200),time^3,log(time))%*%(m.moLiang$est)
plot(time,gp1-gp0,xlab="Time",ylab="Difference in means",type="l",ylim=c(min(gp1-gp0,diffLiang),max(gp1-gp0,diffLiang)))
lines(time,diffLiang,col=2)
legend(110,-8,legend=c("IIW estimate","MO + Liang estimate"),lty=1,col=1:2,bty="n")


