library(randomizr)


### Name: complete_ra_probabilities
### Title: probabilities of assignment: Complete Random Assignment
### Aliases: complete_ra_probabilities

### ** Examples

# 2-arm designs
prob_mat <- complete_ra_probabilities(N=100)
head(prob_mat)

prob_mat <- complete_ra_probabilities(N=100, m=50)
head(prob_mat)

prob_mat <- complete_ra_probabilities(N=100, prob = .3)
head(prob_mat)

prob_mat <- complete_ra_probabilities(N=100, m_each = c(30, 70),
                          conditions = c("control", "treatment"))
head(prob_mat)

# Multi-arm Designs
prob_mat <- complete_ra_probabilities(N=100, num_arms=3)
head(prob_mat)

prob_mat <- complete_ra_probabilities(N=100, m_each=c(30, 30, 40))
head(prob_mat)

prob_mat <- complete_ra_probabilities(N=100, m_each=c(30, 30, 40),
                          conditions=c("control", "placebo", "treatment"))
head(prob_mat)

prob_mat <- complete_ra_probabilities(N=100, conditions=c("control", "placebo", "treatment"))
head(prob_mat)

prob_mat <- complete_ra_probabilities(N=100, prob_each = c(.2, .7, .1))
head(prob_mat)




