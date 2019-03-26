library(dispRity)


### Name: bhatt.coeff
### Title: Bhattacharrya Coefficient
### Aliases: bhatt.coeff

### ** Examples

## Two dummy distributions
x <- rnorm(1000, 0, 1)
y <- rnorm(1000, 1, 2)

## What is the probability of overlap of these distributions?
bhatt.coeff(x, y)




