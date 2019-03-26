library(measures)


### Name: BrierScaled
### Title: Brier scaled
### Aliases: BrierScaled

### ** Examples

n = 20
set.seed(125)
truth = as.factor(sample(c(1,0), n, replace = TRUE))
probabilities = runif(n)
response = as.factor(as.numeric(probabilities > 0.5))
positive = 1
negative = 0
BrierScaled(probabilities, truth, negative, positive)



