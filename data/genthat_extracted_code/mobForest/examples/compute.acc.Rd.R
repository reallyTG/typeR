library(mobForest)


### Name: compute.acc
### Title: Predictive accuracy estimates across trees for logistic
###   regression model
### Aliases: compute.acc

### ** Examples

response <- as.data.frame( c(rep(0, 10000), rep(1, 10000)))
predictions <-
  matrix(nrow = 20000, ncol = 3,
         data = c(rep(.1, 15000), rep(.8, 5000), rep(.1, 15000),
                  rep(.8, 5000), rep(.1, 15000), rep(.8, 5000)))
compute.acc(response, predictions, prob_cutoff = .5)



