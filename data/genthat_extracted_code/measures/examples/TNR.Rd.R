library(measures)


### Name: TNR
### Title: True negative rate
### Aliases: TNR

### ** Examples

n = 20
set.seed(125)
truth = as.factor(sample(c(1,0), n, replace = TRUE))
probabilities = runif(n)
response = as.factor(as.numeric(probabilities > 0.5))
negative = 0
TNR(truth, response, negative)



