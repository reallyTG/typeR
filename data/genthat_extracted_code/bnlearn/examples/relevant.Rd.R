library(bnlearn)


### Name: relevant
### Title: Identify relevant nodes without learning the Bayesian network
### Aliases: relevant
### Keywords: local learning

### ** Examples

data(learning.test)
X = as.factor(sample(c("x1", "x2"), nrow(learning.test), replace = TRUE))
relevant("A", data = cbind(learning.test, X))
relevant("A", context = "B", data = learning.test,)



