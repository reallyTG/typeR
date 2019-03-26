library(mc2d)


### Name: mcmodel
### Title: Monte Carlo model
### Aliases: mcmodel
### Keywords: methods

### ** Examples

modEC1 <- mcmodel({
 conc <- mcdata(10, "0")
 cook <- mcstoc(rempiricalD, values=c(0, 1/5, 1/50), prob=c(0.027, 0.373, 0.600))
 serving <- mcstoc(rgamma, shape=3.93, rate=0.0806)
 expo <- conc * cook * serving
 dose <- mcstoc(rpois, lambda=expo)
 risk <- 1-(1-0.001)^dose
 mc(conc, cook, serving, expo, dose, risk)
 })
evalmcmod(modEC1, nsv=100, nsu=100)



