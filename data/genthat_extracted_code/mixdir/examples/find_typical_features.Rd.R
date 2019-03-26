library(mixdir)


### Name: find_typical_features
### Title: Find the most typical features and values for each latent class
### Aliases: find_typical_features

### ** Examples

  data("mushroom")
  res <- mixdir(mushroom[1:30, ], beta=1)
  find_typical_features(res, top_n=3)




