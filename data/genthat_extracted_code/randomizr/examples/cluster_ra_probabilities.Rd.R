library(randomizr)


### Name: cluster_ra_probabilities
### Title: probabilities of assignment: Cluster Random Assignment
### Aliases: cluster_ra_probabilities

### ** Examples


# Two Group Designs
clusters <- rep(letters, times = 1:26)
prob_mat <- cluster_ra_probabilities(clusters = clusters)
head(prob_mat)

prob_mat <- cluster_ra_probabilities(clusters = clusters, m = 10)
head(prob_mat)

prob_mat <- cluster_ra_probabilities(clusters = clusters,
                                     m_each = c(9, 17),
                                     conditions = c("control", "treatment"))

# Multi-arm Designs
prob_mat <- cluster_ra_probabilities(clusters = clusters, num_arms = 3)
head(prob_mat)

prob_mat <- cluster_ra_probabilities(clusters = clusters, m_each = c(7, 7, 12))
head(prob_mat)

prob_mat <- cluster_ra_probabilities(clusters = clusters, m_each = c(7, 7, 12),
                         conditions=c("control", "placebo", "treatment"))
head(prob_mat)

prob_mat <- cluster_ra_probabilities(clusters = clusters,
                         conditions=c("control", "placebo", "treatment"))
head(prob_mat)

prob_mat <- cluster_ra_probabilities(clusters = clusters,
                                     prob_each = c(.1, .2, .7))
head(prob_mat)






