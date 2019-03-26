library(discreteRV)


### Name: outcomes
### Title: Outcomes of random variable X
### Aliases: outcomes

### ** Examples

X.Bern <- RV(c(1,0), c(.5,.5))
outcomes(X.Bern)

X.fair.die <- RV(1:6, rep(1/6,6))
outcomes(X.fair.die)

X.loaded.die <- RV(1:6, odds = c(1,1,1,1,2,4))
outcomes(X.loaded.die)



