library(CAISEr)


### Name: calc_phi
### Title: Calculates the sample estimator of (simple or percent)
###   differences
### Aliases: calc_phi

### ** Examples

x1 <- rnorm(25, 3, 0.5)
x2 <- runif(15, 4, 6)
calc_phi(x1, x2, "simple")
calc_phi(x1, x2, "perc")



