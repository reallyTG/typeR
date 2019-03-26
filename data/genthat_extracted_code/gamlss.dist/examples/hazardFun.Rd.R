library(gamlss.dist)


### Name: hazardFun
### Title: Hazard functions for gamlss.family distributions
### Aliases: hazardFun gen.hazard
### Keywords: distribution regression

### ** Examples

gen.hazard("WEI2")
y<-seq(0,10,by=0.01)
plot(hWEI2(y, mu=1, sigma=1)~y, type="l", col="black", ylab="h(y)", ylim=c(0,2.5))
lines(hWEI2(y, mu=1, sigma=1.2)~y, col="red",lt=2,lw=2)
lines(hWEI2(y, mu=1, sigma=.5)~y, col="blue",lt=3,lw=2)




