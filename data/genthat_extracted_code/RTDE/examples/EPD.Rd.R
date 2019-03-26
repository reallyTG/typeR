library(RTDE)


### Name: EPD
### Title: The Extended Pareto Distribution
### Aliases: EPD dEPD pEPD qEPD rEPD
### Keywords: distribution

### ** Examples


#####
# (1) density function
x <- seq(0, 5, length=24)

cbind(x, dEPD(x, 1/2, 1/4, -1))

#####
# (2) distribution function

cbind(x, pEPD(x, 1/2, 1/4, -1, lower=FALSE))




		



