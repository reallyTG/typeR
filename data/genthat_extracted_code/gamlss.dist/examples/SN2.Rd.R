library(gamlss.dist)


### Name: SN2
### Title: Skew Normal Type 2 distribution for fitting a GAMLSS
### Aliases: SN2 dSN2 pSN2 qSN2 rSN2
### Keywords: distribution regression

### ** Examples

par(mfrow=c(2,2))
y<-seq(-3,3,0.2)
plot(y, dSN2(y), type="l" , lwd=2)
q<-seq(-3,3,0.2)
plot(q, pSN2(q), ylim=c(0,1), type="l", lwd=2) 
p<-seq(0.0001,0.999,0.05)
plot(p, qSN2(p), type="l", lwd=2)
dat <- rSN2(100)
hist(rSN2(100), nclass=30)



