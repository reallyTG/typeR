library(measures)


### Name: MultilabelHamloss
### Title: Hamming loss
### Aliases: MultilabelHamloss

### ** Examples

n = 20
set.seed(122)
truth = matrix(sample(c(0,1), 60, replace = TRUE), 20, 3)
response = matrix(sample(c(0,1), 60, replace = TRUE), 20, 3)
MultilabelHamloss(truth, response)



