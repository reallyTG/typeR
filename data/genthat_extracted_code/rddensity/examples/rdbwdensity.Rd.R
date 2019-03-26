library(rddensity)


### Name: rdbwdensity
### Title: Bandwidth Selection for Manipulation Testing Using
###   Local-Polynomial Density Estimation.
### Aliases: rdbwdensity

### ** Examples

set.seed(42); x <- rnorm(2000, mean = -0.5)
summary(rdbwdensity(X = x, vce="jackknife"))




