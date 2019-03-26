### R code from vignette source 'unconditionalExact2x2Tests.Rnw'

###################################################
### code chunk number 1: unconditionalExact2x2Tests.Rnw:355-375
###################################################
library(exact2x2)
par(mfrow=c(2,2))
n1<-n2<-8
Tstat<-pickTstat("FisherAdj", parmtype = "difference", tsmethod="central")
plotT(Tstat,n1,n2,0,main="FisherAdj")
Tstat<-pickTstat("simple", parmtype = "difference", tsmethod="central")
plotT(Tstat,n1,n2,0,main="simple difference, beta0=0")
Tstat<-pickTstat("simple", parmtype = "ratio", tsmethod="central")
plotT(Tstat,n1,n2,1,main="simple ratio, beta0=1")
Tstat<-pickTstat("simple", parmtype = "oddsratio", tsmethod="central")
plotT(Tstat,n1,n2,1,main="simple oddsratio, beta0=1")

#TallTB<-calcTall(Tstat, allx=rep(0:n1,n2+1), n1, 
#         ally=rep(0:n2, each=n1+1), n2, 
#         delta0=0, parmtype="difference", 
#                   alternative="two.sided", tsmethod="central", tiebreak=TRUE)
#plotT(TallTB,n1,n2,0,main="simple difference, tie break, beta0=0")
#Tstat<-pickTstat("wald-pooled", parmtype = "difference", tsmethod="central")
#plotT(Tstat,n1,n2,0,main="wald-pooled (difference), beta0=0")
par(mfrow=c(1,1))


###################################################
### code chunk number 2: unconditionalExact2x2Tests.Rnw:387-408
###################################################
library(exact2x2)
par(mfrow=c(2,2))
n1<-n2<-8
Tstat<-pickTstat("FisherAdj", parmtype = "difference", tsmethod="central")
plotT(Tstat,n1,n2,0,main="FisherAdj")
TallTB<-calcTall(Tstat, allx=rep(0:n1,n2+1), n1, 
         ally=rep(0:n2, each=n1+1), n2, 
         delta0=0, parmtype="difference", 
                   alternative="two.sided", tsmethod="central", tiebreak=TRUE)
plotT(TallTB,n1,n2,0,main="simple difference, tie break, beta0=0")


Tstat<-pickTstat("score", parmtype = "difference", tsmethod="central")
plotT(Tstat,n1,n2,0,main="score difference, beta0=0")
Tstat<-pickTstat("wald-pooled", tsmethod="central")
plotT(Tstat,n1,n2,0,main="wald-pooled, beta0=0")


#Tstat<-pickTstat("wald-pooled", parmtype = "difference", tsmethod="central")
#plotT(Tstat,n1,n2,0,main="wald-pooled (difference), beta0=0")
par(mfrow=c(1,1))


###################################################
### code chunk number 3: unconditionalExact2x2Tests.Rnw:424-439
###################################################
library(exact2x2)
par(mfrow=c(2,2))
n1<-n2<-8
Tstat<-pickTstat("simple", parmtype = "difference", tsmethod="central")
plotT(Tstat,n1,n2,0.01,main="simple difference, beta0=0.01")
TallTB<-calcTall(Tstat, allx=rep(0:n1,n2+1), n1, 
         ally=rep(0:n2, each=n1+1), n2, 
         delta0=0, parmtype="difference", 
                   alternative="two.sided", tsmethod="central", tiebreak=TRUE)
plotT(TallTB,n1,n2,0.01,main="simple diff, tie break, beta0=0.01")
Tstat<-pickTstat("wald-pooled", parmtype = "difference", tsmethod="central")
plotT(Tstat,n1,n2,0.01,main="wald-pooled (diff), beta0=0.01")
Tstat<-pickTstat("wald-unpooled", parmtype = "difference", tsmethod="central")
plotT(Tstat,n1,n2,0.01,main="wald-unpooled (diff), beta0=0.01")
par(mfrow=c(1,1))


###################################################
### code chunk number 4: unconditionalExact2x2Tests.Rnw:455-467
###################################################
library(exact2x2)
par(mfrow=c(2,2))
n1<-n2<-8

Tstat<-pickTstat("simple", parmtype = "difference", tsmethod="square")
plotT(Tstat,n1,n2,0,main="simple diff, T^2, beta0=0")
plotT(Tstat,n1,n2,0,main="simple diff, T^2, beta0=0.01")
Tstat<-pickTstat("wald-pooled", tsmethod="square")
plotT(Tstat,n1,n2,0,main="wald-pooled, T^2, beta0=0")
plotT(Tstat,n1,n2,.01,main="wald-pooled, T^2, beta0=0.01")

par(mfrow=c(1,1))


###################################################
### code chunk number 5: unconditionalExact2x2Tests.Rnw:478-488
###################################################
x1<-5
n1<-13
x2<-12
n2<-14
delta<- -99:99/100
p<-rep(NA,length(delta))
for (i in 1:length(delta)){
  p[i]<-uncondExact2x2(x1,n1,x2,n2, parmtype = "difference", tsmethod="square", method="wald-pooled", conf.int=FALSE, nullparm=delta[i])$p.value
}
plot(delta,p,xlab=expression(beta[0]))


