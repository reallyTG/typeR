library(Dowd)


### Name: HSES
### Title: Expected Shortfall of a portfolio using Historical Estimator
### Aliases: HSES

### ** Examples

# Computes Historical Expected Shortfall for a given profit/loss
   # distribution and confidence level
   a <- rnorm(100) # generate a random profit/loss vector
   HSES(a, 0.95)



