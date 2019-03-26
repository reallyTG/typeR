library(measures)


### Name: MultilabelSubset01
### Title: Subset-0-1 loss
### Aliases: MultilabelSubset01

### ** Examples

n = 20
set.seed(122)
truth = matrix(sample(c(0,1), 60, replace = TRUE), 20, 3)
response = matrix(sample(c(0,1), 60, replace = TRUE), 20, 3)
MultilabelSubset01(truth, response)



