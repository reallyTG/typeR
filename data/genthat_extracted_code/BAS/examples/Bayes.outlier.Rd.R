library(BAS)


### Name: Bayes.outlier
### Title: Bayesian Outlier Detection
### Aliases: Bayes.outlier

### ** Examples

data("stackloss")
stack.lm <- lm(stack.loss ~ ., data = stackloss)
stack.outliers <- Bayes.outlier(stack.lm, k = 3)
plot(stack.outliers$prob.outlier, type = "h", ylab = "Posterior Probability")
# adjust for sample size for calculating prior prob that a
# a case is an outlier
stack.outliers <- Bayes.outlier(stack.lm, prior.prob = 0.95)
# cases where posterior probability exceeds prior probability
which(stack.outliers$prob.outlier > stack.outliers$prior.prob)



