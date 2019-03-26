library(RFOC)


### Name: alpha95
### Title: 95 percent confidence for Spherical Distribution
### Aliases: alpha95
### Keywords: misc univar

### ** Examples



paz = rnorm(100, mean=297, sd=10)
pdip = rnorm(100, mean=52, sd=8)
ALPH = alpha95(paz, pdip)

#########  draw stereonet
net()
############  add points
focpoint(paz, pdip, col='red',  pch=3, lab="", UP=FALSE)
###############  add 95 percent confidence bounds
addsmallcirc(ALPH$Dr, ALPH$Ir, ALPH$Alph95, BALL.radius = 1, N = 25,
add = TRUE, lwd=1, col='blue')

############  second example:
paz = rnorm(100, mean=297, sd=100)
pdip = rnorm(100, mean=52, sd=20)
ALPH = alpha95(paz, pdip)

net()
focpoint(paz, pdip, col='red',  pch=3, lab="", UP=FALSE)

addsmallcirc(ALPH$Dr, 90-ALPH$Ir, ALPH$Alph95, BALL.radius = 1, N = 25,
add = TRUE, lwd=1, col='blue')







