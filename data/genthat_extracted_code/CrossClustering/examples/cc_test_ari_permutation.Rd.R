library(CrossClustering)


### Name: cc_test_ari_permutation
### Title: A permutation test for testing the null hypothesis of random
###   agreement (i.e., adjusted Rand Index equal to 0) between two
###   partitions.
### Aliases: cc_test_ari_permutation

### ** Examples

library(CrossClustering)

clusters <- iris[-5] %>%
  dist %>%
  hclust(method = 'ward.D') %>%
  cutree(k = 3)

ground_truth <- iris[[5]] %>% as.numeric()

CrossClustering:::cc_test_ari_permutation(ground_truth, clusters)




