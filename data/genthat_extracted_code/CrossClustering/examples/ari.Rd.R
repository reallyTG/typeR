library(CrossClustering)


### Name: ari
### Title: Computes the adjusted Rand index and the confidence interval,
###   comparing two classifications from a contingency table.
### Aliases: ari print.ari

### ** Examples


#### This example compares the adjusted Rand Index as computed on the
### partitions given by Ward's algorithm with the ground truth on the
### famous Iris data set by the adjustedRandIndex function
### {mclust package} and by the ari function.

library(CrossClustering)
library(mclust)

clusters <- iris[-5] %>%
  dist %>%
  hclust(method = 'ward.D') %>%
  cutree(k = 3)

ground_truth <- iris[[5]] %>% as.numeric()

mc_ari <- adjustedRandIndex(clusters, ground_truth)
mc_ari

ari_cc <- table(ground_truth, clusters) %>%
  ari(digits = 7)
ari_cc

all.equal(mc_ari, unclass(ari_cc), check.attributes = FALSE)




