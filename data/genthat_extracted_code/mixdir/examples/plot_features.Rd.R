library(mixdir)


### Name: plot_features
### Title: Plot cluster distribution for a subset of features features
### Aliases: plot_features

### ** Examples

  data("mushroom")
  res <- mixdir(mushroom[1:100, ], n_latent=4)
  plot_features(c("bruises", "edible"), res$category_prob)

  res2 <- mixdir(mushroom[1:100, ], n_latent=20)
  def_feats <- find_defining_features(res2, mushroom[1:100, ], n_features=Inf)
  plot_features(def_feats$features[1:6], category_prob = res2$category_prob,
               classes=which(res$lambda > 0.01))



