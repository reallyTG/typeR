library(ald)


### Name: ALD
### Title: The Asymmetric Laplace Distribution
### Aliases: ALD dALD pALD qALD rALD
### Keywords: asymmetric laplace distribution quantile regression Laplace
###   ALD

### ** Examples

## Let's plot an Asymmetric Laplace Distribution!

##Density
library(ald)
sseq = seq(-40,80,0.5)
dens = dALD(y=sseq,mu=50,sigma=3,p=0.75)
plot(sseq,dens,type = "l",lwd=2,col="red",xlab="x",ylab="f(x)", main="ALD Density function")

#Look that is an special case of the skewed family in Galarza (2016)
#with sigma_new = 2*sigma
require(lqr)
dens2 = dSKD(y = sseq,mu = 50,sigma = 3*2,p = 0.75,dist = "laplace")
points(sseq,dens2,pch="+",cex=0.75)

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



