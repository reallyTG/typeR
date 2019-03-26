library(cmaesr)


### Name: cmaes
### Title: Covariance-Matrix-Adaptation
### Aliases: cmaes
### Keywords: optimize

### ** Examples

# generate objective function from smoof package
fn = makeRosenbrockFunction(dimensions = 2L)
res = cmaes(
  fn,
  monitor = NULL,
  control = list(
    sigma = 1.5,
    lambda = 40,
    stop.ons = c(list(stopOnMaxIters(100L)), getDefaultStoppingConditions())
  )
)
print(res)




