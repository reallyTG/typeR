library(ParamHelpers)


### Name: sampleValue
### Title: Sample a random value from a parameter or a parameter set
###   uniformly.
### Aliases: sampleValue

### ** Examples

# bounds are necessary here, can't sample with Inf bounds:
u = makeNumericParam("x", lower = 0, upper = 1)
# returns a random number between 0 and 1:
sampleValue(u)

p = makeDiscreteParam("x", values = c("a","b","c"))
# can be either "a", "b" or "c"
sampleValue(p)

p = makeIntegerVectorParam("x", len = 2, lower = 1, upper = 5)
# vector of two random integers between 1 and 5:
sampleValue(p)

ps = makeParamSet(
  makeNumericParam("x", lower = 1, upper = 10),
  makeIntegerParam("y", lower = 1, upper = 10),
  makeDiscreteParam("z", values = 1:2)
)
sampleValue(ps)



