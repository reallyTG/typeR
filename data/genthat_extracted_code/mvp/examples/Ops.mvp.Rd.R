library(mvp)


### Name: Ops.mvp
### Title: Arithmetic Ops Group Methods for mvp objects
### Aliases: Ops.mvp Ops mvp_negative mvp_times_mvp mvp_times_scalar
###   mvp_plus_mvp mvp_plus_numeric mvp_plus_scalar mvp_power_scalar
###   mvp_eq_mvp
### Keywords: symbolmath

### ** Examples

p1 <- rmvp(3)
p2 <- rmvp(3)

p1*p2

p1+p2

p1^3


p1*(p1+p2) == p1^2+p1*p2  # should be TRUE




