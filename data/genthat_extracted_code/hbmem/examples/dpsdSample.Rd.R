library(hbmem)


### Name: dpsdSample
### Title: Function to fit hierarchical DPSD model to data.
### Aliases: dpsdSample
### Keywords: models

### ** Examples

#In this example we generate data from EVSD, then fit it with both
#hierarchical DPSD and DPSD assuming no participant or item effects.
library(hbmem)
sim=dpsdSim(I=30,J=200)
dat=as.data.frame(cbind(sim@subj,sim@item,sim@cond,sim@Scond,sim@lag,sim@resp))
colnames(dat)=c("sub","item","cond","Scond","lag","resp")
dat$lag[dat$Scond==1]=dat$lag[dat$Scond==1]-mean(dat$lag[dat$Scond==1])

M=10 #Too low for real analysis!
keep=2:M
DPSD=dpsdSample(dat,M=M)

#Look at all parameters
par(mfrow=c(3,3),pch=19,pty='s')

matplot(DPSD@blockN[,DPSD@muN],t='l',
ylab="muN")
abline(h=sim@muN,col="blue")
plot(DPSD@estN[DPSD@alphaN]~sim@alphaN)
abline(0,1,col="blue")
plot(DPSD@estN[DPSD@betaN]~sim@betaN)
abline(0,1,col="blue")

matplot(DPSD@blockS[,DPSD@muS],t='l',
ylab="muS")
abline(h=sim@muS,col="blue")
plot(DPSD@estS[DPSD@alphaS]~sim@alphaS)
abline(0,1,col="blue")
plot(DPSD@estS[DPSD@betaS]~sim@betaS)
abline(0,1,col="blue")

matplot(pnorm(DPSD@blockR[,DPSD@muS]),t='l',
ylab="P(recollection)")
abline(h=pnorm(sim@muR),col="blue")
plot(DPSD@estR[DPSD@alphaS]~sim@alphaR)
abline(0,1,col="blue")
plot(DPSD@estR[DPSD@betaS]~sim@betaR)
abline(0,1,col="blue")



