library(Boom)


### Name: pairs.density
### Title: Pairs plot for posterior distributions.
### Aliases: PairsDensity
### Keywords: hplot

### ** Examples


## You can see the pairs plot for a single set of draws.
y <- matrix(rnorm(5000, mean = 1:5), ncol = 5, byrow = TRUE)
PairsDensity(y)

## You can also compare two or more sets of draws.
z <- matrix(rnorm(2500, mean = 2:6), ncol = 5, byrow = TRUE)
PairsDensity(list("first set" = y, "second set" = z))




