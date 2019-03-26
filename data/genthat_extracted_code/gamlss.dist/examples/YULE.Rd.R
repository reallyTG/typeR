library(gamlss.dist)


### Name: YULE
### Title: Yule distribution for fitting a GAMLSS model
### Aliases: YULE dYULE pYULE qYULE rYULE
### Keywords: distribution regression

### ** Examples

par(mfrow=c(2,2))
y<-seq(0,20,1)
plot(y, dYULE(y), type="h")
q <- seq(0, 20, 1)
plot(q, pYULE(q), type="h")
p<-seq(0.0001,0.999,0.05)
plot(p , qYULE(p), type="s")
dat <- rYULE(100)
hist(dat)
#summary(gamlss(dat~1, family=YULE))



