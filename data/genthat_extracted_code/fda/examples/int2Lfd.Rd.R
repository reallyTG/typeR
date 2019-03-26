library(fda)


### Name: int2Lfd
### Title: Convert Integer to Linear Differential Operator
### Aliases: int2Lfd
### Keywords: smooth

### ** Examples

# Lfd to penalize the squared acceleration
# typical for smoothing a cubic spline (order 4)
int2Lfd(2)

# Lfd to penalize the curvature of acceleration
# used with splines of order 6
# when it is desired to study velocity and acceleration
int2Lfd(4)



