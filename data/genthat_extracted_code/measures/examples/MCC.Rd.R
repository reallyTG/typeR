library(measures)


### Name: MCC
### Title: Matthews correlation coefficient
### Aliases: MCC

### ** Examples

n = 20
set.seed(125)
truth = as.factor(sample(c(1,0), n, replace = TRUE))
probabilities = runif(n)
response = as.factor(as.numeric(probabilities > 0.5))
positive = 1
negative = 0
MCC(truth, response, negative, positive)



