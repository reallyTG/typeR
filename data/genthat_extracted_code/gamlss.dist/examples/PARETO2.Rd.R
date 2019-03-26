library(gamlss.dist)


### Name: PARETO2
### Title: Pareto Type 2 distribution for fitting a GAMLSS
### Aliases: PARETO2 dPARETO2 pPARETO2 qPARETO2 rPARETO2 PARETO2o dPARETO2o
###   pPARETO2o qPARETO2o rPARETO2o
### Keywords: distribution regression

### ** Examples

par(mfrow=c(2,2))
y<-seq(0.2,20,0.2)
plot(y, dPARETO2(y), type="l" , lwd=2)
q<-seq(0,20,0.2)
plot(q, pPARETO2(q), ylim=c(0,1), type="l", lwd=2) 
p<-seq(0.0001,0.999,0.05)
plot(p, qPARETO2(p), type="l", lwd=2)
dat <- rPARETO2(100)
hist(rPARETO2(100), nclass=30)
#summary(gamlss(a~1, family="PARETO2"))



