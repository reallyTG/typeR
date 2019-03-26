library(LDOD)


### Name: ldexpdose
### Title: Locally D-optimal designs for Exponential dose-response model
### Aliases: ldexpdose
### Keywords: optimal design Exponential equivalence theorem

### ** Examples

ldexpdose(a = 1, b = 2, c = 3, lb = 0, ub = 9) # $points: 0.000000 6.471562 9.000000

## D-effecincy computation|:
ldexpdose(a = 1, b = 2, c = 3, lb = 0, ub = 9, user.points = c(1, 5, 4),
user.weights = rep(.33, 3)) # $user.eff: 0.07392



