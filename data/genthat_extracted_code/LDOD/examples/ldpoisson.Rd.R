library(LDOD)


### Name: ldpoisson
### Title: Locally D-optimal designs for Poisson model
### Aliases: ldpoisson
### Keywords: optimal design Poisson equivalence theorem

### ** Examples

ldpoisson(a = .9, b = .8, form = 1, lb = -5, ub = 5) # $points: 2.5 5.0

ldpoisson(a = .9, b = .8, form = 2, lb = -5, ub = 5) # $points: -5.0 -2.5

## D-effecincy computation
ldpoisson(a = .9 , b = .8, lb = -5, ub = 5, user.points = c(3, 4), 
          user.weights = c(.5, .5)) # $user.eff: 0.32749

## usage of n.sim and n.restars
# Various responses for different values of rseed

ldpoisson(a = 22 , b = 16, lb = 9, ub = 12, rseed = 12) 
# $points: 9.208083 11.467731

ldpoisson(a = 22 , b = 16, lb = 9, ub = 12, rseed = 10) 
# $points: 10.05836 11.80563

ldpoisson(a = 22 , b = 16, lb = 9, ub = 12, n.restarts = 10, n.sim = 10) 
# (valid respnse) $points: 11.875, 12.000



