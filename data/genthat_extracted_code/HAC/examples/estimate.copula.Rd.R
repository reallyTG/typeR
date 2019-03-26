library(HAC)


### Name: estimate.copula
### Title: Estimation of Hierarchical Archimedean Copulae
### Aliases: estimate.copula

### ** Examples

# define the copula model
tree = list(list("X1", "X5", 3), list("X2", "X3", "X4", 4), 2)
model = hac(type = 1, tree = tree)

# sample from copula model
x = rHAC(1000, model)

# in the following case the true model is binary approximated
est.obj = estimate.copula(x, type = 1, method = 1, epsilon = 0)
plot(est.obj)

# consider also the aggregation of the variables
est.obj = estimate.copula(x, type = 1, method = 1, epsilon = 0.2)
plot(est.obj)

# full ML estimation to yield more precise parameter
est.obj.full = estimate.copula(x, type = 1, method = 2, hac = est.obj)

# recursive ML estimation leads to almost identical results
est.obj.r = estimate.copula(x, type = 1, method = 3)



