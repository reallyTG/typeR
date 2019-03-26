library(LDOD)


### Name: ldrichards
### Title: Locally D-optimal designs for Richards model
### Aliases: ldrichards
### Keywords: optimal design Richards equivalence theorem

### ** Examples

ldrichards(a = 1, b = 2, lambda = 2, h = 3, lb = 0, ub =3) 
# $points: 0.1805017 0.8296549 1.6139494 3.0000000

## usage of n.sim and n.restars
# Various responses for different values of rseed

ldrichards(a = 1, b = 4, lambda = 3, h = 6, lb = 0, ub = 19, rseed = 6) 
# $points: 5.022689 11.520735 17.815197 19.000000

ldrichards(a = 1, b = 4, lambda = 3, h = 6, lb = 0, ub = 19, rseed = 7) 
# $points: 2.198258  7.557164 18.789277 19.000000

ldrichards(a = 1, b = 4, lambda = 3, h = 6, lb = 0, ub = 19, n.sim = 5, n.restarts = 5) 
# (valid response) $points: 0.6562008  1.0485843  1.5894946 19.000000



