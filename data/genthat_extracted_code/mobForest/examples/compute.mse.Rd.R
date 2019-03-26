library(mobForest)


### Name: compute.mse
### Title: Predictive accuracy estimates (MSE) across trees for linear or
###   poisson regression model.
### Aliases: compute.mse

### ** Examples

# The MSE should be 2.5. Off by 2 half the time, off by 1 the other half
response <- matrix(c(rep(0,100), rep(10,100)))
predictions <-
    matrix(nrow=20, ncol = 3,
           data = c(rep(1,100), rep(8,100), rep(1,100), rep(8,100),
                    rep(1,100), rep(8,100)))
compute.mse(response, predictions)




