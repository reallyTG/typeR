library(hbmem)


### Name: gammaLikeSample
### Title: Function gammaLikeSample
### Aliases: gammaLikeSample

### ** Examples

#This function is broken, so
#no example that works.
#make data from gamma model
if(1==0)
{
library(hbmem)
sim=gammaLikeSim(I=50,J=400,muS=log(.5),s2aS=0,s2bS=0)
dat=as.data.frame(cbind(sim@subj,sim@item,sim@cond,sim@Scond,sim@lag,sim@resp))
colnames(dat)=c("sub","item","cond","Scond","lag","resp")
dat$lag=0

table(dat$resp,dat$Scond)
M=5000
keep=500:M
gamma=gammaLikeSample(dat,M=M,keep=keep,jump=.001)

par(mfrow=c(2,3),pch=19,pty='s')
matplot(exp(gamma@blockS[,gamma@muS]),t='l',xlab="Iteration",ylab="Mu-S")
abline(h=exp(sim@muS),col="blue")
#Estimates of Alpha as function of true values
plot(gamma@estS[gamma@alphaS]~sim@alphaS,xlab="True
Alpha-S",ylab="Est. Alpha-S");abline(0,1,col="blue")
#Estimates of Beta as function of true values
plot(gamma@estS[gamma@betaS]~sim@betaS,xlab="True
Beta-S",ylab="Est. Beta-S");abline(0,1,col="blue")

#Look at some criteria
for(i in 1:3){
matplot(t(exp(gamma@s.crit[i,2:7,])),t='l')
abline(h=sim@crit[i,])
}

gamma@estS[c(gamma@s2alphaS,gamma@s2betaS)]
}




