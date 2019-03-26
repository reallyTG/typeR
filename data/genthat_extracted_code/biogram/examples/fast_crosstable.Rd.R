library(biogram)


### Name: fast_crosstable
### Title: Very fast 2d cross-tabulation
### Aliases: fast_crosstable

### ** Examples

tar <- sample(0L:1, 100, replace = TRUE)
feat <- sample(0L:1, 100, replace = TRUE)
library(bit) # used to code vector as bit
fast_crosstable(as.bit(tar), length(tar), sum(tar),  feat)



