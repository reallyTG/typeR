library(ParamHelpers)


### Name: isFeasible
### Title: Check if parameter value is valid.
### Aliases: isFeasible

### ** Examples

p = makeNumericParam("x", lower = -1, upper = 1)
isFeasible(p, 0) # True
isFeasible(p, 2) # False, out of bounds
isFeasible(p, "a") # False, wrong type
# now for parameter sets
ps = makeParamSet(
  makeNumericParam("x", lower = -1, upper = 1),
  makeDiscreteParam("y", values = c("a", "b"))
)
isFeasible(ps, list(0, "a")) # True
isFeasible(ps, list("a", 0)) # False, wrong order



