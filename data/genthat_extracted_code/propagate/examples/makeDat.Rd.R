library(propagate)


### Name: makeDat
### Title: Create a dataframe from the variables defined in an expression
### Aliases: makeDat
### Keywords: algebra univariate

### ** Examples

## Simulating from uniform
## and normal distribution,
## run 'propagate'.
EXPR1 <- expression(a + b^c)
a <- rnorm(100000, 12, 1)
b <- rnorm(100000, 5, 0.1)
c <- runif(100000, 6, 7)

DAT1 <- makeDat(EXPR1)
propagate(EXPR1, DAT1, type = "sim", cov = FALSE)



