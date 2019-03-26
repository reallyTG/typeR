library(ecr)


### Name: ecr
### Title: Interface to ecr similar to the optim function.
### Aliases: ecr
### Keywords: optimize

### ** Examples

fn = function(x) {
   sum(x^2)
}
lower = c(-5, -5); upper = c(5, 5)
res = ecr(fn, n.dim = 2L, n.objectives = 1L, lower = lower, upper = lower,
 representation = "float", mu = 20L, lambda = 10L,
  mutator = setup(mutGauss, lower = lower, upper = upper))



