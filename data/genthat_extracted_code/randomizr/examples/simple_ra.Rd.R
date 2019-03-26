library(randomizr)


### Name: simple_ra
### Title: Simple Random Assignment
### Aliases: simple_ra

### ** Examples

# Two Group Designs

Z <- simple_ra(N=100)
table(Z)

Z <- simple_ra(N=100, prob=0.5)
table(Z)

Z <- simple_ra(N=100, prob_each = c(0.3, 0.7),
               conditions = c("control", "treatment"))
table(Z)

# Multi-arm Designs
Z <- simple_ra(N=100, num_arms=3)
table(Z)

Z <- simple_ra(N=100, prob_each=c(0.3, 0.3, 0.4))
table(Z)

Z <- simple_ra(N=100, prob_each=c(0.3, 0.3, 0.4),
               conditions=c("control", "placebo", "treatment"))
table(Z)

Z <- simple_ra(N=100, conditions=c("control", "placebo", "treatment"))
table(Z)



