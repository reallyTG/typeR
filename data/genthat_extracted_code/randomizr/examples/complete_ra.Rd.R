library(randomizr)


### Name: complete_ra
### Title: Complete Random Assignment
### Aliases: complete_ra

### ** Examples

# Two-arm Designs
Z <- complete_ra(N = 100)
table(Z)

Z <- complete_ra(N = 100, m = 50)
table(Z)

Z <- complete_ra(N = 100, prob = .111)
table(Z)

Z <- complete_ra(N = 100, conditions = c("control", "treatment"))
table(Z)


# Multi-arm Designs
Z <- complete_ra(N = 100, num_arms = 3)
table(Z)

Z <- complete_ra(N = 100, m_each = c(30, 30, 40))
table(Z)

Z <- complete_ra(N = 100, prob_each = c(.1, .2, .7))
table(Z)

Z <- complete_ra(N = 100, conditions = c("control", "placebo", "treatment"))
table(Z)

# Special Cases
# Two-arm trial where the conditions are by default "T1" and "T2"
Z <- complete_ra(N = 100, num_arms = 2)
table(Z)

# If N = m, assign with 100% probability
complete_ra(N=2, m=2)

# Up through randomizr 0.12.0, 
complete_ra(N=1, m=1) # assigned with 50% probability
# This behavior has been deprecated




