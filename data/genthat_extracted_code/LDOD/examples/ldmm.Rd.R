library(LDOD)


### Name: ldmm
### Title: Locally D-optimal designs for Michaelis-Menten model
### Aliases: ldmm
### Keywords: optimal design Michaelis-Menten equivalence theorem

### ** Examples

ldmm(a = 1, b = 2, form = 1, lb = 0, ub =3) # $points: 0.375 3.000

ldmm(a = 1, b = 2, form = 2, lb = 0, ub =3) # $points: 0.8571428 3.0000000

ldmm(a = 1, b = 2, form = 3, lb = 0, ub =3) # $points: 0.375 3.000

## D-effecincy computation:
ldmm(a = 1, b = 2, form = 3, lb = 0, ub =3, user.points = c(.5, 3, 2),
user.weights = rep(.33, 3)) # $user.eff: 0.83174



