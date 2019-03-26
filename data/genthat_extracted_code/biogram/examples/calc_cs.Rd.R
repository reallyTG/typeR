library(biogram)


### Name: calc_cs
### Title: Calculate Chi-squared-based measure
### Aliases: calc_cs

### ** Examples

tar <- sample(0L:1, 100, replace = TRUE)
feat <- sample(0L:1, 100, replace = TRUE)
library(bit) # used to code vector as bit
calc_cs(feat, as.bit(tar), 100, sum(tar))



