library(randomizr)


### Name: block_and_cluster_ra_probabilities
### Title: probabilities of assignment: Blocked and Clustered Random
###   Assignment
### Aliases: block_and_cluster_ra_probabilities

### ** Examples


clusters <- rep(letters, times=1:26)
blocks <- rep(NA, length(clusters))
blocks[clusters %in% letters[1:5]] <- "block_1"
blocks[clusters %in% letters[6:10]] <- "block_2"
blocks[clusters %in% letters[11:15]] <- "block_3"
blocks[clusters %in% letters[16:20]] <- "block_4"
blocks[clusters %in% letters[21:26]] <- "block_5"


prob_mat <- block_and_cluster_ra_probabilities(clusters = clusters,
                                               blocks = blocks)
head(prob_mat)
                                    
prob_mat <- block_and_cluster_ra_probabilities(clusters = clusters,
                                               blocks = blocks,
                                               num_arms = 3)
head(prob_mat)
                                    
prob_mat <- block_and_cluster_ra_probabilities(clusters = clusters,
                                               blocks = blocks,
                                               prob_each = c(.2, .5, .3))
head(prob_mat)                                    

block_m_each <- rbind(c(2, 3),
                      c(1, 4),
                      c(3, 2),
                      c(2, 3),
                      c(5, 1))

prob_mat <- block_and_cluster_ra_probabilities(clusters = clusters, 
                                               blocks = blocks, 
                                               block_m_each = block_m_each)
head(prob_mat)                                    





