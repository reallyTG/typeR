library(LDOD)


### Name: ldloglin
### Title: Locally D-optimal designs for Log-linear model
### Aliases: ldloglin
### Keywords: optimal design Log-linear equivalence theorem

### ** Examples

ldloglin(a= 1, b = 1, c = 3, lb = 0, ub =3) 
# $points: 0.000000 1.158884 3.000000

## D-effecincy computation:
ldloglin(a = 1, b = 1, c = 3, lb = 0, ub =3, user.points = c(0.18, 0.82, 1.61, 3, 2),
user.weights = rep(1, 5)) # $user.eff: 0.68677



