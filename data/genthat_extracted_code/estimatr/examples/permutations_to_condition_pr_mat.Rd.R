library(estimatr)


### Name: permutations_to_condition_pr_mat
### Title: Builds condition probability matrices for Horvitz-Thompson
###   estimation from permutation matrix
### Aliases: permutations_to_condition_pr_mat

### ** Examples


# Complete randomization
perms <- replicate(1000, sample(rep(0:1, each = 50)))
comp_pr_mat <- permutations_to_condition_pr_mat(perms)

# Arbitrary randomization
possible_treats <- cbind(
  c(1, 1, 0, 1, 0, 0, 0, 1, 1, 0),
  c(0, 1, 1, 0, 1, 1, 0, 1, 0, 1),
  c(1, 0, 1, 1, 1, 1, 1, 0, 0, 0)
)
arb_pr_mat <- permutations_to_condition_pr_mat(possible_treats)
# Simulating a column to be realized treatment
z <- possible_treats[, sample(ncol(possible_treats), size = 1)]
y <- rnorm(nrow(possible_treats))
horvitz_thompson(y ~ z, condition_pr_mat = arb_pr_mat)




