library(biogram)


### Name: calc_kl
### Title: Calculate KL divergence of features
### Aliases: calc_kl

### ** Examples

tar <- sample(0L:1, 100, replace = TRUE)
feat <- sample(0L:1, 100, replace = TRUE)
library(bit) # used to code vector as bit
calc_kl(feat, as.bit(tar), 100, sum(tar))



