library(estimatr)


### Name: declaration_to_condition_pr_mat
### Title: Builds condition probability matrices for Horvitz-Thompson
###   estimation from 'randomizr' declaration
### Aliases: declaration_to_condition_pr_mat

### ** Examples


# Learn condition probability matrix from complete blocked design
library(randomizr)
n <- 100
dat <- data.frame(
  blocks = sample(letters[1:10], size = n, replace = TRUE),
  y = rnorm(n)
)

# Declare complete blocked randomization
bl_declaration <- declare_ra(blocks = dat$blocks, prob = 0.4, simple = FALSE)
# Get probabilities
block_pr_mat <- declaration_to_condition_pr_mat(bl_declaration, 0, 1)
# Do randomiztion
dat$z <- conduct_ra(bl_declaration)

horvitz_thompson(y ~ z, data = dat, condition_pr_mat = block_pr_mat)

# When you pass a declaration to horvitz_thompson, this function is called

# Equivalent to above call
horvitz_thompson(y ~ z, data = dat, ra_declaration = bl_declaration)




