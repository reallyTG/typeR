library(lmeVarComp)


### Name: test.additivity
### Title: Testing Additivity in Nonparametric Regression
### Aliases: test.additivity

### ** Examples

set.seed(20L)
x <- matrix(runif(200L), 100L, 2L)
y <- 4 * x[, 1L] * x[, 2L] + rnorm(100L)
test.additivity(x, y)



