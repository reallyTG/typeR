library(bivgeom)


### Name: FyxbivgeomRoy
### Title: Conditional distribution
### Aliases: FyxbivgeomRoy
### Keywords: distribution

### ** Examples

theta1 <- 0.5
theta2 <- 0.7
theta3 <- 0.9
# probability that Y<=3 given that X=2:
FyxbivgeomRoy(3, theta1, theta2, theta3, 2)
# the unconditional probability would be
pgeom(3, 1-theta2) # i.e. a geometric distribution with parameter 1-theta2



