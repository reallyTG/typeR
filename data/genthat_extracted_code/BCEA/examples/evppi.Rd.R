library(BCEA)


### Name: evppi
### Title: Expected Value of Perfect Partial Information (EVPPI) for
###   selected parameters
### Aliases: evppi evppi.default
### Keywords: Expected Health economic evaluation information of partial
###   value

### ** Examples


# See Baio G., Dawid A.P. (2011) for a detailed description of the 
# Bayesian model and economic problem
#
# Load the processed results of the MCMC simulation model
# data(Vaccine)
# 
# Runs the health economic evaluation using BCEA
# m <- bcea(e,c,ref=2,interventions=treats)
#
# Computes the EVPPI for a bunch of parameters
# inp <- CreateInputs(vaccine)
# Computes the EVPPI using INLA/SPDE
# x0 <- evppi(parameter=c(38:40),input=inp$mat,he=m)
# Now uses GAM regression
# x1 <- evppi(parameter=c(38:40),input=inp$mat,he=m,method="GAM")
# Now uses the GP regression
# x2 <- evppi(parameter=c(38:40),input=inp$mat,he=m,method="GP")
# Now plots the results
# plot(x0)
# points(x0$k,x0$evppi,lwd=2,lty=2,t="l")
# points(x1$k,x1$evppi,t="l",col="red")
# points(x2$k,x2$evppi,t="l",col="blue")




