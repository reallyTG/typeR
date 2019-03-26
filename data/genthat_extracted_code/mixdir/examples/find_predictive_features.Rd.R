library(mixdir)


### Name: find_predictive_features
### Title: Find the top predictive features and values for each latent
###   class
### Aliases: find_predictive_features

### ** Examples

  data("mushroom")
  res <- mixdir(mushroom[1:30, ], beta=1)
  find_predictive_features(res, top_n=3)




