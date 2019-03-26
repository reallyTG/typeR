library(measures)


### Name: MMCE
### Title: Mean misclassification error
### Aliases: MMCE

### ** Examples

n = 20
set.seed(122)
truth = as.factor(sample(c(1,2,3), n, replace = TRUE))
response = as.factor(sample(c(1,2,3), n, replace = TRUE))
MMCE(truth, response)



