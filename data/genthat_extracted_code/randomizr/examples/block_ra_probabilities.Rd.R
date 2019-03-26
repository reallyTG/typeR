library(randomizr)


### Name: block_ra_probabilities
### Title: probabilities of assignment: Block Random Assignment
### Aliases: block_ra_probabilities

### ** Examples


blocks <- rep(c("A", "B","C"), times = c(50, 100, 200))
prob_mat <- block_ra_probabilities(blocks = blocks)
head(prob_mat)

prob_mat <- block_ra_probabilities(blocks = blocks, m = 20)
head(prob_mat)

block_m_each <- rbind(c(25, 25),
                 c(50, 50),
                 c(100, 100))

prob_mat <- block_ra_probabilities(blocks = blocks, block_m_each = block_m_each)
head(prob_mat)

block_m_each <- rbind(c(10, 40),
                 c(30, 70),
                 c(50, 150))

prob_mat <- block_ra_probabilities(blocks = blocks,
                                   block_m_each = block_m_each,
                                   conditions = c("control", "treatment"))
head(prob_mat)

prob_mat <- block_ra_probabilities(blocks = blocks, num_arms = 3)
head(prob_mat)

block_m_each <- rbind(c(10, 20, 20),
                 c(30, 50, 20),
                 c(50, 75, 75))
prob_mat <- block_ra_probabilities(blocks = blocks, block_m_each = block_m_each)
head(prob_mat)

prob_mat <- block_ra_probabilities(blocks=blocks, block_m_each=block_m_each,
                       conditions=c("control", "placebo", "treatment"))
head(prob_mat)

prob_mat <- block_ra_probabilities(blocks=blocks, prob_each=c(.1, .1, .8))
head(prob_mat)




