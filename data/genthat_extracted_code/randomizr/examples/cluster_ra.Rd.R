library(randomizr)


### Name: cluster_ra
### Title: Cluster Random Assignment
### Aliases: cluster_ra

### ** Examples

# Two Group Designs
clusters <- rep(letters, times=1:26)

Z <- cluster_ra(clusters = clusters)
table(Z, clusters)

Z <- cluster_ra(clusters = clusters, m = 13)
table(Z, clusters)

Z <- cluster_ra(clusters = clusters, m_each = c(10, 16),
                conditions = c("control", "treatment"))
table(Z, clusters)

# Multi-arm Designs
Z <- cluster_ra(clusters = clusters, num_arms = 3)
table(Z, clusters)

Z <- cluster_ra(clusters = clusters, m_each = c(7, 7, 12))
table(Z, clusters)

Z <- cluster_ra(clusters = clusters, m_each = c(7, 7, 12),
                conditions = c("control", "placebo", "treatment"))
table(Z, clusters)

Z <- cluster_ra(clusters = clusters,
                conditions = c("control", "placebo", "treatment"))
table(Z, clusters)



