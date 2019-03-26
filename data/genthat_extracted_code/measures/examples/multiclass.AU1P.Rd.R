library(measures)


### Name: multiclass.AU1P
### Title: Weighted average 1 vs. 1 multiclass AUC
### Aliases: multiclass.AU1P

### ** Examples

n = 20
set.seed(122)
truth = as.factor(sample(c(1,2,3), n, replace = TRUE))
probabilities = matrix(runif(60), 20, 3)
probabilities = probabilities/rowSums(probabilities)
colnames(probabilities) = c(1,2,3)
multiclass.AU1P(probabilities, truth)



