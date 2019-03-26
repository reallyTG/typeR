library(CAISEr)


### Name: calc_ropt
### Title: Calculates the optimal ratio of sample sizes
### Aliases: calc_ropt

### ** Examples

set.seed(1234)
x1 <- rnorm(25, 5, 1)
x2 <- runif(35, 8, 10)
calc_ropt(x1, x2, "simple")
calc_ropt(x1, x2, "perc")



