library(HAC)


### Name: to.logLik
### Title: log-likelihood
### Aliases: to.logLik

### ** Examples

# construct a hac-model
tree = list(list("X1", "X5", 3), list("X2", "X3", "X4", 4), 2)
model = hac(type = 1, tree = tree)

# sample from copula model
sample = rHAC(1000, model)

# check the accurancy of the estimation procedure
ll = to.logLik(sample, model)
ll.value = to.logLik(sample, model, eval = TRUE)

ll(c(2, 3, 4)) == ll.value # [1] TRUE



