library(cds)


### Name: addbounds
### Title: Augment with Boundaries Between Rating Scale Categories and Rank
### Aliases: addbounds

### ** Examples

set.seed(1234)
mat <- matrix(sample(1:9, 12, replace = TRUE), nrow = 4, ncol = 3)
addbounds(mat, q = 9)



