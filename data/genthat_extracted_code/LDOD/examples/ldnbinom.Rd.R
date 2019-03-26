library(LDOD)


### Name: ldnbinom
### Title: Locally D-optimal designs for Negative Binomial model
### Aliases: ldnbinom
### Keywords: optimal design Negative Binomial equivalence theorem

### ** Examples

ldnbinom(a = 2, b = 3, theta = 10, lb = -3, ub =3) 
# $points: -3.0000000 -0.8115872

## D-effecincy computation:
ldnbinom(a = 2, b = 3, theta = 10, lb = -3, ub =3, user.points = c(2, -3),
user.weights = rep(.5, 2)) # $user.eff: 0.06099



