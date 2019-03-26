library(PointFore)


### Name: constant
### Title: Constant specification model
### Aliases: constant

### ** Examples

# the returned level does not depend on the state variable
constant(0,.5)
constant(1,.5)

# if theta is not in the unit interval, the constant specification model forces it to be so
constant(0, 2)
constant(0, -1)



