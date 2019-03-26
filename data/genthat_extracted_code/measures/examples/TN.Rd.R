library(measures)


### Name: TN
### Title: True negatives
### Aliases: TN

### ** Examples

n = 20
set.seed(125)
truth = as.factor(sample(c(1,0), n, replace = TRUE))
probabilities = runif(n)
response = as.factor(as.numeric(probabilities > 0.5))
negative = 0
TN(truth, response, negative)



