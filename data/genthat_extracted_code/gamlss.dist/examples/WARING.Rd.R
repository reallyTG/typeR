library(gamlss.dist)


### Name: WARING
### Title: Waring distribution for fitting a GAMLSS model
### Aliases: WARING dWARING pWARING qWARING rWARING
### Keywords: distribution regression

### ** Examples

par(mfrow=c(2,2))
y<-seq(0,20,1)
plot(y, dWARING(y), type="h")
q <- seq(0, 20, 1)
plot(q, pWARING(q), type="h")
p<-seq(0.0001,0.999,0.05)
plot(p , qWARING(p), type="s")
dat <- rWARING(100)
hist(dat)
#summary(gamlss(dat~1, family=WARING))



