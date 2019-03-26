library(mobForest)


### Name: compute.r2
### Title: Predictive accuracy estimates across trees for linear or poisson
###   regression
### Aliases: compute.r2

### ** Examples

# This example explains 90% of the variance
response <- matrix(c(rep(0, 100), rep(10, 100)))
predictions <-
  matrix(nrow = 200, ncol = 3,
         data = c(rep(1, 100), rep(8, 100), rep(1, 100), rep(8, 100),
                  rep(1, 100), rep(8, 100)))
compute.r2(response, predictions)



