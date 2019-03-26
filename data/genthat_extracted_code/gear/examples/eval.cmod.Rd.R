library(gear)


### Name: eval.cmod
### Title: Evaluate covariance or semivariance model.
### Aliases: eval.cmod eval.cmod.cmodStd

### ** Examples

n = 10
coords = matrix(runif(2*n), nrow = n, ncol = 2)
d = as.matrix(dist(coords))
cmod = cmod.std(model = "exponential", psill = 1, r = 1)
eval.cmod(cmod, d)



