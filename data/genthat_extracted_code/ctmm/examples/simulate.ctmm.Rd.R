library(ctmm)


### Name: simulate.ctmm
### Title: Predict or simulate from a continuous-time movement model
### Aliases: predict predict.ctmm predict.telemetry simulate simulate.ctmm
###   simulate.telemetry

### ** Examples

#Load package
library(ctmm)

#prepare simulation parameters
t <- 1:1000
MODEL <- ctmm(tau=c(100,10),sigma=10,mu=c(0,0))

#simulate data
SIM <- simulate(MODEL,t=t)

#plot data with Gaussian model
plot(SIM,CTMM=MODEL)



