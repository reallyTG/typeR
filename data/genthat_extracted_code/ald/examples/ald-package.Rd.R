library(ald)


### Name: ald-package
### Title: The Asymmetric Laplace Distribution
### Aliases: ald-package ald
### Keywords: package

### ** Examples

## Let's plot an Asymmetric Laplace Distribution!

##Density
sseq = seq(-40,80,0.5)
dens = dALD(y=sseq,mu=50,sigma=3,p=0.75)
plot(sseq,dens,type="l",lwd=2,col="red",xlab="x",ylab="f(x)", main="ALD Density function")

## Distribution Function
df = pALD(q=sseq,mu=50,sigma=3,p=0.75)
plot(sseq,df,type="l",lwd=2,col="blue",xlab="x",ylab="F(x)", main="ALD Distribution function")
abline(h=1,lty=2)

##Inverse Distribution Function
prob = seq(0,1,length.out = 1000)
idf = qALD(prob=prob,mu=50,sigma=3,p=0.75)
plot(prob,idf,type="l",lwd=2,col="gray30",xlab="x",ylab=expression(F^{-1}~(x)))
title(main="ALD Inverse Distribution function")
abline(v=c(0,1),lty=2)

#Random Sample Histogram
sample = rALD(n=10000,mu=50,sigma=3,p=0.75)
hist(sample,breaks = 70,freq = FALSE,ylim=c(0,max(dens)),main="")
title(main="Histogram and True density")
lines(sseq,dens,col="red",lwd=2)

## Let's compute the MLE's

param = c(-323,40,0.9)
y = rALD(10000,mu = param[1],sigma = param[2],p = param[3])  #A random sample
res = mleALD(y)

#Comparing
cbind(param,res$par)

#Let's plot

seqq = seq(min(y),max(y),length.out = 1000)
dens = dALD(y=seqq,mu=res$par[1],sigma=res$par[2],p=res$par[3])
hist(y,breaks=50,freq = FALSE,ylim=c(0,max(dens)))
lines(seqq,dens,type="l",lwd=2,col="red",xlab="x",ylab="f(x)", main="ALD Density function")




