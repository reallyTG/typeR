library(randomizr)


### Name: obtain_permutation_probabilities
### Title: Obtain the probabilities of permutations
### Aliases: obtain_permutation_probabilities

### ** Examples


declaration <- declare_ra(N = 5, prob_each = c(.49, .51))
obtain_num_permutations(declaration)
perm_probs <- obtain_permutation_probabilities(declaration)
perms <- obtain_permutation_matrix(declaration)

# probabilities of assignment from declaration *should* match the average over all permutations
true_probabilities <- declaration$probabilities_matrix[,2]
true_probabilities

# correctly WRONG because the perms have different probs!
rowMeans(perms)

# correctly correct!
perms %*% perm_probs




