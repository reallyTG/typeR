library(stepR)


### Name: monteCarloSimulation
### Title: Monte Carlo simulation
### Aliases: monteCarloSimulation
### Keywords: nonparametric

### ** Examples

# monteCarloSimulation will be called in critVal, can be called explicitly
# object of class MCSimulationVector
stat <- monteCarloSimulation(n = 100L)
## No test: 
identical(critVal(n = 100L, alpha = 0.5, stat = stat),
          critVal(n = 100L, alpha = 0.5,
                  options = list(load = list(), simulation = "matrix")))

# object of class MCSimulationMaximum
stat <- monteCarloSimulation(n = 100L, output = "maximum")
identical(critVal(n = 100L, alpha = 0.5, stat = stat),
          critVal(n = 100L, alpha = 0.5,
                  options = list(load = list(), simulation = "vector")))

# different interval system, lengths and penalty
monteCarloSimulation(n = 100L, output = "maximum", intervalSystem = "dyaLen",
              lengths = c(1L, 2L, 4L, 8L), penalty = "log")

# with a different number of iterations, different seed,
# reported progress and user written rand.gen function
stat <- monteCarloSimulation(n = 100L, r = 1e3, seed = 1, messages = 100,
                             rand.gen = function(data) {rnorm(100)})

# the optional argument sd of parametric family "gauss" will be replaced by 1
identical(monteCarloSimulation(n = 100L, r = 1e3, sd = 5),
          monteCarloSimulation(n = 100L, r = 1e3, sd = 1))

# simulation for family "hsmuce"
monteCarloSimulation(n = 100L, family = "hsmuce")

# simulation for family "mDependentGauss"
# covariances must be given (can also be given by correlations or filter)
stat <- monteCarloSimulation(n = 100L, family = "mDependentPS",
                             covariances = c(1, 0.5, 0.3))

# variance will be standardized to 1
# output might be on some systems even identical
all.equal(monteCarloSimulation(n = 100L, family = "mDependentPS",
                               covariances = c(2, 1, 0.6)), stat)
## End(No test)


