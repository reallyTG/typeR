library(GAS)


### Name: UniGASSim
### Title: Simulate Univariate GAS processes
### Aliases: UniGASSim

### ** Examples

# Simulate from a GAS process with Student-t conditional
# distribution, time-varying location, scale and fixed shape parameter.

library(GAS)

set.seed(786)

T.sim  = 1000 # number of observations to simulate
Dist   = "std" # conditional Studen-t distribution


# vector of unconditional reparametrised parameters such that, the unconditional level of
# \eqn{\theta}_{t} is (0, 1.5 ,7), i.e. location = 0, scale = 1.5,
# degrees of freedom = 7.

kappa = c(0.0, log(1.5), log(7-2.01))

# in this way we specify that the shape parameter is constant while the score
# coefficients for the location and the scale
# parameters are 0.001 and 0.01, respectively.

A = matrix(c(0.001 , 0.0  , 0.0 ,
             0.0   , 0.01 , 0.0 ,
             0.0   , 0.0  , 0.0 ), 3, byrow = TRUE)

B = matrix(c(0.7 , 0.0 , 0.0 ,
              0.0 , 0.98, 0.0 ,
              0.0 , 0.0 , 0.0),3,byrow = TRUE) # Matrix of autoregressive parameters.

Sim = UniGASSim(fit = NULL, T.sim, kappa, A, B, Dist, ScalingType = "Identity")

Sim



