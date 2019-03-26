library(LDOD)


### Name: ldemax
### Title: Locally D-optimal designs for 3-parameter Emax model
### Aliases: ldemax
### Keywords: optimal design Emax equivalence theorem

### ** Examples

ldemax(a = 1, b = 2, c = 3, lb = 0, ub = 9) # $points: 0.0 1.8 9.0

## D-effecincy computation:
ldemax(a = 1, b = 2, c = 3, lb = 0, ub = 9, user.points = c(1, 5, 4),
user.weights = rep(.33, 3)) # $user.eff:  0.15379



