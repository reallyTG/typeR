library(poisbinom)


### Name: Poisson-Binomial
### Title: The Poisson Binomial Distribution
### Aliases: dpoisbinom qpoisbinom ppoisbinom rpoisbinom
### Keywords: distribution

### ** Examples

## Binomial probabilities
pp <- runif(500)

## PMF
dpoisbinom(36, pp)

## CDF
ppoisbinom(36, pp)

## Quantile function
qpoisbinom(0.3, pp)

## Random deviates
rpoisbinom(5, pp)



