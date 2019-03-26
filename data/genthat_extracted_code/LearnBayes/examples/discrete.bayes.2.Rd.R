library(LearnBayes)


### Name: discrete.bayes.2
### Title: Posterior distribution of two parameters with discrete priors
### Aliases: discrete.bayes.2 plot.bayes2
### Keywords: models

### ** Examples

p1 = seq(0.1, 0.9, length = 9)
p2 = p1
prior = matrix(1/81, 9, 9)
dimnames(prior)[[1]] = p1
dimnames(prior)[[2]] = p2
discrete.bayes.2(twoproplike,prior)



