library(HAC)


### Name: plot.hac
### Title: Plot of a HAC
### Aliases: plot.hac

### ** Examples

# a hac object is created

tree = list(list("X1", "X5", 3), list("X2", "X3", "X4", 4), 2)
model = hac(type = 1, tree = tree)
plot(model)

# the same procedure works for an estimated object

sample = rHAC(2000, model)
est.obj = estimate.copula(sample, epsilon = 0.2)
plot(est.obj)



