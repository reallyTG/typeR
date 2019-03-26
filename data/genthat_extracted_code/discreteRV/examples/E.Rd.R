library(discreteRV)


### Name: E
### Title: Expected value of a random variable
### Aliases: E

### ** Examples

X.Bern <- RV(c(1,0), c(.5,.5))
E(X.Bern)

X.fair.die <- RV(1:6, rep(1/6,6))
E(X.fair.die)



