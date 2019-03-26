library(mgcv)


### Name: scat
### Title: GAM scaled t family for heavy tailed data
### Aliases: scat t.scaled
### Keywords: models regression

### ** Examples

library(mgcv)
## Simulate some t data...
set.seed(3);n<-400
dat <- gamSim(1,n=n)
dat$y <- dat$f + rt(n,df=4)*2

b <- gam(y~s(x0)+s(x1)+s(x2)+s(x3),family=scat(link="identity"),data=dat)

b
plot(b,pages=1)




