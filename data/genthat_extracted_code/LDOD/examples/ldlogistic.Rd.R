library(LDOD)


### Name: ldlogistic
### Title: Locally D-optimal designs for Logistic model
### Aliases: ldlogistic
### Keywords: optimal design Logistic equivalence theorem

### ** Examples

ldlogistic(a = .9 , b = .8, form = 1, lb = -5, ub = 5)
# $points: -3.0542559  0.8042557

## usage of n.sim and n.restars:
# Various responses for different values of rseed

ldlogistic(a = 20 , b = 10, form = 1, lb = -5, ub = 5, rseed = 9) 
# $points: -4.746680 -1.976591 

ldlogistic(a = 20 , b = 10, form = 1, lb = -5, ub = 5, rseed = 11) 
# $points -4.994817 -2.027005

ldlogistic(a = 20 , b = 10, form = 1, lb = -5, ub = 5, n.restarts = 5, n.sim = 5)
# (valid response) $points: -2.15434, -1.84566

## usage of precision:
ldlogistic(a = 22 , b = 10, form = 1, lb = -5, ub = 20, n.restarts = 7, n.sim = 7,
           user.points = c(20, 5), user.weights = c(.5, .5)) # $user.eff: NaN

ldlogistic(a = 22 , b = 10, form = 1, lb = -5, ub = 20, n.restarts = 7, n.sim = 7,
           user.points = c(20, 5), user.weights = c(.5, .5), prec = 321) # $user.eff: 0



