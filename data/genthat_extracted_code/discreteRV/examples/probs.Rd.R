library(discreteRV)


### Name: probs
### Title: Probability mass function of random variable X
### Aliases: probs

### ** Examples

X.Bern <- RV(c(1,0), c(.5,.5))
probs(X.Bern)

X.fair.die <- RV(1:6, rep(1/6,6))
probs(X.fair.die)

X.loaded.die <- RV(1:6, odds = c(1,1,1,1,2,4))
probs(X.loaded.die)



