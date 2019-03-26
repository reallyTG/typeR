library(mobForest)


### Name: logistic.acc
### Title: Contingency table: Predicted vs. Observed Outcomes
### Aliases: logistic.acc

### ** Examples

# We should get 15 predictions correct and miss 5
response <- matrix(c(rep(0,10), rep(1,10)))
predicted <- c(rep(.1,15), rep(.8,5))
logistic.acc(response, predicted, .5)	




