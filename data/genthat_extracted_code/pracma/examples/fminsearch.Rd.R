library(pracma)


### Name: fminsearch
### Title: Minimum Finding
### Aliases: fminsearch
### Keywords: optimize

### ** Examples

# Rosenbrock function
rosena <- function(x, a) 100*(x[2]-x[1]^2)^2 + (a-x[1])^2  # min: (a, a^2)

fminsearch(rosena, c(-1.2, 1), a = sqrt(2))
# x = (1.414214 2.000010) , fval = 1.239435e-11

fminsearch(rosena, c(-1.2, 1), dfree=FALSE, a = sqrt(2))
# x = (1.414214 2.000000) , fval = 3.844519e-26



