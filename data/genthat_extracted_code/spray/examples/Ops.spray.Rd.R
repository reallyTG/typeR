library(spray)


### Name: Ops.spray
### Title: Arithmetic Ops Group Methods for sprays
### Aliases: Ops.spray Ops spray_negative spray_times_spray
###   spray_times_scalar spray_plus_spray spray_plus_scalar
###   spray_power_scalar spray_eq_spray
### Keywords: symbolmath

### ** Examples



M <- matrix(sample(0:3,21,replace=TRUE),ncol=3)
a <- spray(M,sample(7))
b <- homog(3,4)


# arithmetic operators mostly work as expected:
a + 2*b
a - a*b^2/4
a+b

S1 <- spray(partitions::compositions(4,3))
S2 <- spray(diag(3))  # S2 = x+y+z


stopifnot( (S1+S2)^3 == S1^3 + 3*S1^2*S2 + 3*S1*S2^2 + S2^3 )









