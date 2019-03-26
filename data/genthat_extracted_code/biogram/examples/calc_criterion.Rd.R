library(biogram)


### Name: calc_criterion
### Title: Calculate value of criterion
### Aliases: calc_criterion

### ** Examples

tar <- sample(0L:1, 100, replace = TRUE)
feats <- matrix(sample(0L:1, 400, replace = TRUE), ncol = 4)

# Information Gain
calc_criterion(tar, feats, calc_ig)

# hi-squared-based measure
calc_criterion(tar, feats, calc_cs)

# Kullback-Leibler divergence
calc_criterion(tar, feats, calc_kl)



