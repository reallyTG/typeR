library(SuperLearner)


### Name: trimLogit
### Title: truncated-probabilities logit transformation
### Aliases: trimLogit
### Keywords: models

### ** Examples

x <- c(0.00000001, 0.0001, 0.001, 0.01, 0.1, 0.3, 0.7, 0.9, 0.99, 
  0.999, 0.9999, 0.99999999)
trimLogit(x, trim = 0.001)
data.frame(Prob = x, Logit = qlogis(x), trimLogit = trimLogit(x, 0.001))



