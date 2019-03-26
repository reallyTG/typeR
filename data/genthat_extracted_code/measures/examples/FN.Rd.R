library(measures)


### Name: FN
### Title: False negatives
### Aliases: FN

### ** Examples

n = 20
set.seed(125)
truth = as.factor(sample(c(1,0), n, replace = TRUE))
probabilities = runif(n)
response = as.factor(as.numeric(probabilities > 0.5))
negative = 0
FN(truth, response, negative)



