library(HAC)


### Name: par.pairs
### Title: Parameter of the HAC
### Aliases: par.pairs

### ** Examples

# construct a copula model
tree = list(list("X1", "X5", "X2", 4), list("X3", "X4", "X6", 3), 2)
model = hac(type = 1, tree)

# returns the pairwise parameter
par.pairs(model)

# Kendall's TAU
par.pairs(model, FUN = "TAU")

# sqrt of the parameter
par.pairs(model, function(r)sqrt(r))



