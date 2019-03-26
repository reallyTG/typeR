library(mixdir)


### Name: find_defining_features
### Title: Find the n defining features
### Aliases: find_defining_features

### ** Examples

  data("mushroom")
  res <- mixdir(mushroom[1:100, ], n_latent=20)
  find_defining_features(res, mushroom[1:100, ], n_features=3)
  find_defining_features(res, mushroom[1:100, ], n_features=Inf)



