library(discreteRV)


### Name: P
### Title: Calculate probabilities of events
### Aliases: P

### ** Examples

X.fair.die <- RV(1:6, rep(1/6,6))
P(X.fair.die>3)

X.loaded.die <- RV(1:6, odds = c(1,1,1,1,2,4))
P(X.loaded.die>3)
P(X.loaded.die==6)



