library(breakaway)


### Name: betta_random
### Title: modelling total diversity with random effects
### Aliases: betta_random
### Keywords: diversity

### ** Examples

betta_random(c(2000, 3000, 4000, 3000), c(100, 200, 150, 180),
             X = cbind("Int"=1, "Cont_var"=c(100, 150, 100, 50)),
             groups = c("a", "a", "a", "b"))

## handles missing data
betta_random(c(2000, 3000, 4000, 3000), c(100, 200, 150, NA),
             groups= c("a", NA, "b", "b"))



