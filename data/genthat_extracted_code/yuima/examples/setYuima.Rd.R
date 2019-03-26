library(yuima)


### Name: setYuima
### Title: Creates a "yuima" object by combining "model", "data",
###   "sampling", "characteristic" and "functional"slots.
### Aliases: setYuima
### Keywords: ts

### ** Examples

# Creation of a yuima object with all slots for a 
# stochastic differential equation
# dXt^e = -theta2 * Xt^e * dt + theta1 * dWt 
diffusion <- matrix(c("theta1"), 1, 1)
drift <- c("-1*theta2*x")
ymodel <- setModel(drift=drift, diffusion=diffusion)
n <- 100
ysamp <- setSampling(Terminal=1, n=n)

yuima <- setYuima(model=ymodel, sampling=ysamp)

str(yuima)



