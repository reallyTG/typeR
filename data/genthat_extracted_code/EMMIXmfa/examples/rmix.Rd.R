library(EMMIXmfa)


### Name: rmix
### Title: Random Deviates from EMMIX Models
### Aliases: rmix
### Keywords: multivariate distribution datagen

### ** Examples

set.seed(1)
model <- mcfa(iris[, -5], g=3, q=2, nkmeans=1, nrandom=1, itmax = 25)
dat <- rmix(n = 10, model = model)



