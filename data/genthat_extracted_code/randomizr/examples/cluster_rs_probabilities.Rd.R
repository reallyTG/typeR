library(randomizr)


### Name: cluster_rs_probabilities
### Title: Inclusion Probabilities: Cluster Sampling
### Aliases: cluster_rs_probabilities

### ** Examples


# Two Group Designs
clusters <- rep(letters, times = 1:26)
probs <- cluster_rs_probabilities(clusters = clusters)
table(probs, clusters)

prob_mat <- cluster_rs_probabilities(clusters = clusters, n = 10)
table(probs, clusters)

prob_mat <- cluster_rs_probabilities(clusters = clusters, prob = .3)
table(probs, clusters)





