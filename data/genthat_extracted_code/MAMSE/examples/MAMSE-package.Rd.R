library(MAMSE)


### Name: MAMSE-package
### Title: Minimum Averaged Mean Squared Error (MAMSE) Weights.
### Aliases: MAMSE-package
### Keywords: package multivariate nonparametric survival univar

### ** Examples

set.seed(2009)

# MAMSE weights for univariate data
x=list(rnorm(25),rnorm(250,.1),rnorm(100,-.1))
wx=MAMSE(x)

# Weighted Likelihood estimate for the mean (Normal model)
sum(wx*sapply(x,mean))

#MAMSE weights for copulas
rho=c(.25,.3,.15,.2)
r=2*sin(rho*pi/600)
y=list(0,0,0,0)
for(i in 1:4){
  sig=matrix(c(1,r,r,1),2,2)
  y[[i]]=matrix(rnorm(150),nc=2)
}
wy=MAMSE(y)

# Weighted coefficient of correlation
sum(wy*sapply(y,cor,method="spearman")[2,])

#MAMSE weights for right-censored data

z=list(0,0,0)
for(i in 1:3){  
  zo=rexp(100)
  zc=pmin(rexp(100),rexp(100),rexp(100))
  z[[i]]=cbind(pmin(zo,zc),zo<=zc)
}

MAMSE(z,.5,surv=TRUE)

allz=pmin(.5,c(z[[1]][z[[1]][,2]==1,1],z[[2]][z[[2]][,2]==1,1],
   z[[3]][z[[3]][,2]==1,1]))
K=WKME(z,.5,time=sort(unique(c(0,.5,allz,allz-.0001))))
plot(K$time,K$wkme,type='l',col="blue",xlab="x",ylab="P(X<=x)",
   ylim=c(0,.5))
lines(K$time,K$kme[,1],col="red")
legend(0,.5,c("Weighted Kaplan-Meier","Kaplan-Meier"),
   col=c("blue","red"),lty=c(1,1))

# MAMSE-weighted ROC curve

set.seed(2016)
nh=c(50,25,70,100)
nd=c(40,20,50,80)
muh=c(1.5,1,1.7,1.2)
mud=c(0,.2,.5,.4)

# Target curve
FPR=seq(0,1,.01)
TPR=pnorm(qnorm(FPR,mean=muh[1]),mean=mud[1])

simh=list()
simd=list()

for(i in (1:length(nh))){
  simh[[i]]=rnorm(nh[i],mean=muh[i])
  simd[[i]]=rnorm(nd[i],mean=mud[i])
}

par(mfrow=c(1,2))
plot(roc(simh,simd),col="red")
lines(roc(simh[[1]],simd[[1]]),col="blue")
lines(FPR,TPR,col="gray")
title("Empirical ROC curves")

plot(roc(simh,simd,method="normal"),col="red")
lines(roc(simh[[1]],simd[[1]],method="normal"),col="blue")
lines(FPR,TPR,col="gray")
title("Parametric ROC curves")



