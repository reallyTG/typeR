library(pRSR)


### Name: SimulateAR1
### Title: Simulate AR(1) series
### Aliases: SimulateAR1
### Keywords: ts

### ** Examples

e<-SimulateAR1(10^4, phi=0.8)
mean(e)
sd(e)
acf(e, lag.max=5, plot=FALSE)



