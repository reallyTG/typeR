library(measures)


### Name: multiclass.AUNU
### Title: Average 1 vs. rest multiclass AUC
### Aliases: multiclass.AUNU

### ** Examples

n = 20
set.seed(122)
truth = as.factor(sample(c(1,2,3), n, replace = TRUE))
probabilities = matrix(runif(60), 20, 3)
probabilities = probabilities/rowSums(probabilities)
colnames(probabilities) = c(1,2,3)
multiclass.AUNU(probabilities, truth)



