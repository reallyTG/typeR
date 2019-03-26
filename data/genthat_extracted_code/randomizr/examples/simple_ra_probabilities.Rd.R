library(randomizr)


### Name: simple_ra_probabilities
### Title: probabilities of assignment: Simple Random Assignment
### Aliases: simple_ra_probabilities

### ** Examples

# Two Group Designs
prob_mat <- simple_ra_probabilities(N=100)
head(prob_mat)

prob_mat <- simple_ra_probabilities(N=100, prob=0.5)
head(prob_mat)

prob_mat <- simple_ra_probabilities(N=100, prob_each = c(0.3, 0.7),
                        conditions = c("control", "treatment"))
head(prob_mat)

# Multi-arm Designs
prob_mat <- simple_ra_probabilities(N=100, num_arms=3)
head(prob_mat)

prob_mat <- simple_ra_probabilities(N=100, prob_each=c(0.3, 0.3, 0.4))
head(prob_mat)

prob_mat <- simple_ra_probabilities(N=100, prob_each=c(0.3, 0.3, 0.4),
                        conditions=c("control", "placebo", "treatment"))
head(prob_mat)

prob_mat <- simple_ra_probabilities(N=100, conditions=c("control", "placebo", "treatment"))
head(prob_mat)




