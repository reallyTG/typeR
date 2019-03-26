library(gamlss.dist)


### Name: SN1
### Title: Skew Normal Type 1 distribution for fitting a GAMLSS
### Aliases: SN1 dSN1 pSN1 qSN1 rSN1
### Keywords: distribution regression

### ** Examples

par(mfrow=c(2,2))
y<-seq(-3,3,0.2)
plot(y, dSN1(y), type="l" , lwd=2)
q<-seq(-3,3,0.2)
plot(q, pSN1(q), ylim=c(0,1), type="l", lwd=2) 
p<-seq(0.0001,0.999,0.05)
plot(p, qSN1(p), type="l", lwd=2)
dat <- rSN1(100)
hist(rSN1(100), nclass=30)



