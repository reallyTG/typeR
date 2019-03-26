library(LDOD)


### Name: ldiq
### Title: Locally D-optimal designs for Inverse Quadratic model
### Aliases: ldiq
### Keywords: optimal design Invesre Quadratic equivalence theorem

### ** Examples

ldiq(a = 17 , b = 15, c = 9, form = 1, lb = 0, ub = 15) 
# $points: 0.4141466 1.2909896 4.0242083

## D-effecincy computation
ldiq(a = 17 , b = 15, c = 9, form = 2, lb = 0, ub = 15, user.points = c(10,2,4),
user.weights = c(.33, .33, .33)) # $user.eff: 0.18099



