library(gamlss.dist)


### Name: IGAMMA
### Title: Inverse Gamma distribution for fitting a GAMLSS
### Aliases: IGAMMA dIGAMMA pIGAMMA qIGAMMA rIGAMMA
### Keywords: distribution regression

### ** Examples

par(mfrow=c(2,2))
y<-seq(0.2,20,0.2)
plot(y, dIGAMMA(y), type="l")
q <- seq(0.2, 20, 0.2)
plot(q, pIGAMMA(q), type="l")
p<-seq(0.0001,0.999,0.05)
plot(p , qIGAMMA(p), type="l")
dat <- rIGAMMA(50)
hist(dat)
#summary(gamlss(dat~1, family="IGAMMA"))



