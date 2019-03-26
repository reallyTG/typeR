library(biogram)


### Name: calc_ig
### Title: Calculate IG for single feature
### Aliases: calc_ig

### ** Examples

tar <- sample(0L:1, 100, replace = TRUE)
feat <- sample(0L:1, 100, replace = TRUE)
library(bit) # used to code vector as bit
calc_ig(feat, as.bit(tar), 100, sum(tar))



