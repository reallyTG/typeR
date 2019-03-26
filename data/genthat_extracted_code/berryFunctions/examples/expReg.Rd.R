library(berryFunctions)


### Name: expReg
### Title: Exponential regression with plotting
### Aliases: expReg
### Keywords: aplot hplot regression

### ** Examples


x <- runif(100, 1, 10)
y <- 10^(0.3*x+rnorm(100, sd=0.3)+4)
plot(x,y)
expReg(x,y)
expReg(x,y, logy=FALSE)
expReg(x,y, predictnew=6, plot=FALSE)
expReg(x,y, predictnew=3:6, interval="none", plot=FALSE)




