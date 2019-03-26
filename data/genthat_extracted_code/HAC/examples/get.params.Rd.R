library(HAC)


### Name: get.params
### Title: Dependency parameters of a HAC
### Aliases: get.params

### ** Examples

# construct a copula model
tree = list(list("X1", "X5", "X2", 4), list("X3", "X4", "X6", 3), 2)
model = hac(type = 1, tree)

# return the parameter
get.params(model) # [1] 2 4 3
get.params(model, sort.v = TRUE, decreasing = TRUE) # [1] 4 3 2



