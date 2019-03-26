library(POT)


### Name: tsdep.plot
### Title: Diagnostic for Dependence within Time Series Extremes
### Aliases: tsdep.plot
### Keywords: htest

### ** Examples

##An independent case
tsdep.plot(runif(5000), u = 0.95, lag.max = 5)
##Asymptotic dependence
mc <- simmc(5000, alpha = 0.2)
tsdep.plot(mc, u = 0.95, lag.max = 5)



