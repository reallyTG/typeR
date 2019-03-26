library(LDOD)


### Name: ldweibull
### Title: Locally D-optimal designs for Weibull model
### Aliases: ldweibull
### Keywords: optimal design Weibull equivalence theorem

### ** Examples

ldweibull(a = 1, b = 1, lambda = 2, h = 1, lb = 10^-10, ub =3) 
# $points: 0.0000000001 0.1713914120 0.8002692550 3.0000000000

## usage of n.sim and n.restars:
# Various responses for different rseed

ldweibull(a = 1, b = 1, lambda = 3, h = 1, lb = 0.001, ub = 19, rseed = 1) 
# $points: 0.0010000  0.2991952  5.2428039 19.0000000

ldweibull(a = 1, b = 1, lambda = 3, h = 1, lb = 0.001, ub = 19, rseed = 19) 
# $points: 0.001000  1.217404  3.566328 19.000000

ldweibull(a = 1, b = 1, lambda = 3, h = 1, lb = 0.001, ub = 19, n.sim = 10, n.restarts = 10) 
# (valid respone) $points: 0.0010000, 0.1205858,  0.5544623, 19.0000000



