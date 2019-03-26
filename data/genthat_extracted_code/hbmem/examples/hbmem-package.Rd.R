library(hbmem)


### Name: hbmem-package
### Title: Hierarchical Models of Recognition Memory
### Aliases: hbmem-package hbmem
### Keywords: package

### ** Examples

#In this example data are simulated from EVSD
#They are then fit by both UVSD and DPSD

library(hbmem)
sim=uvsdSim(s2aS2=0,s2bS2=0) #Simulate data from hierarchical EVSD
dat=as.data.frame(cbind(sim@subj,sim@item,sim@Scond,sim@cond,sim@lag,sim@resp))
colnames(dat)=c("sub","item","Scond","cond","lag","resp")

M=10 #Set way low for speed
keep=2:M
#For real analysis we run 105000 iterations
#with the first 5000 serving as burnin, and
#only keep every 10th iteration for analysis,
#i.e., thinning the chanins to mitgate autocorrelation.
evsd=uvsdSample(dat,M=M,keep=keep,equalVar=TRUE) #Fit EVSD
uvsd=uvsdSample(dat,M=M,keep=keep,freeSig2=TRUE) #Fit UVSD w/1 Sigma2
dpsd=dpsdSample(dat,M=M,keep=keep) #Fit DPSD 

#Look at available information
slotNames(uvsd)
slotNames(dpsd)

#Compare DIC; smaller is better
evsd@DIC
uvsd@DIC
dpsd@DIC

#Effective parameters.  Because there are no
#real effects on studied-item variance, the
#hierarchical models are drastically shrinking these
#effect parameters to zero, so that they do not
#count as full parameters.
evsd@pD
uvsd@pD
dpsd@pD

#PLOTS FROM UVSD FIT
par(mfrow=c(3,2),pch=19,pty='s')
#Make sure chains look OK
matplot(uvsd@blockN[,uvsd@muN],t='l',xlab="Iteration",ylab="Mu-N")
abline(h=sim@muN,col="blue")
matplot(uvsd@blockS[,uvsd@muS],t='l',xlab="Iteration",ylab="Mu-S")
abline(h=sim@muS,col="blue")

#Estimates of Alpha as function of true values
plot(uvsd@estN[uvsd@alphaN]~sim@alphaN,xlab="True
Alpha-N",ylab="Est. Alpha-N");abline(0,1,col="blue")
plot(uvsd@estS[uvsd@alphaS]~sim@alphaS,xlab="True
Alpha-S",ylab="Est. Alpha-S");abline(0,1,col="blue")
#Estimates of Beta as function of true values
plot(uvsd@estN[uvsd@betaN]~sim@betaN,xlab="True
Beta-N",ylab="Est. Beta-N");abline(0,1,col="blue")
plot(uvsd@estS[uvsd@betaS]~sim@betaS,xlab="True
Beta-S",ylab="Est. Beta-S");abline(0,1,col="blue")

###Look at Sigma2 and Recollection from UVSD and DPSD###
par(mfrow=c(2,3),pch=19,pty='s')
plot(sqrt(exp(uvsd@blockS2[,uvsd@muS])),
t='l',ylab="Sigma",main="Grand Mean")
abline(h=1,col="blue")
hist(uvsd@blockS2[,uvsd@s2alphaS],main="Participant Effect")
hist(uvsd@blockS2[,uvsd@s2betaS],main="Item Effect")

plot(pnorm(dpsd@blockR[,dpsd@muS]),
t='l',ylab="P(Recollection)",main="Grand Mean")
abline(h=0,col="blue")
hist(dpsd@blockR[,dpsd@s2alphaS],main="Participant Effect")
hist(dpsd@blockR[,dpsd@s2betaS],main="Item Effect")


#See what DPSD does with EVSD effects
par(mfrow=c(2,3))
plot(dpsd@estN[dpsd@alphaN]~sim@alphaN,xlab="True
Alpha-N",ylab="DPSD Alpha-N");abline(0,1,col="blue")
plot(dpsd@estS[dpsd@alphaS]~sim@alphaS,xlab="True
Alpha-S",ylab="DPSD Alpha-S");abline(0,1,col="blue")
plot(dpsd@estR[dpsd@alphaS]~sim@alphaS,xlab="True
Alpha-S",ylab="DPSD Alpha-R");abline(0,1,col="blue")

plot(dpsd@estN[dpsd@betaN]~sim@betaN,xlab="True
Beta-N",ylab="DPSD Beta-N");abline(0,1,col="blue")
plot(dpsd@estS[dpsd@betaS]~sim@betaS,xlab="True
Beta-S",ylab="DPSD Beta-S");abline(0,1,col="blue")
plot(dpsd@estR[dpsd@betaS]~sim@betaS,xlab="True
Beta-S",ylab="DPSD Beta-R");abline(0,1,col="blue")



