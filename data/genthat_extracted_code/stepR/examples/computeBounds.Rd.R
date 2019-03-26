library(stepR)


### Name: computeBounds
### Title: Computation of the bounds
### Aliases: computeBounds
### Keywords: nonparametric

### ** Examples

y <- c(rnorm(50), rnorm(50, 1))

# the multiscale contraint
bounds <- computeBounds(y, alpha = 0.5)

# the order of the bounds depends on intervalSystem and lengths
# to allow fast computation
# if a specific order is required it can be reordered by order
# b is ordered with increasing left indices and increasing right indices
b <- bounds[order(bounds$li, bounds$ri), ]
attr(b, "row.names") <- seq(along = b$li)

# higher significance level for larger detection power, but less confidence
computeBounds(y, alpha = 0.99)

# smaller significance level for stronger confidence statements, but at
# the risk of missing change-points
computeBounds(y, alpha = 0.05)
## No test: 
# different interval system, lengths, penalty and given parameter sd
computeBounds(y, alpha = 0.5, intervalSystem = "dyaLen",
              lengths = c(1L, 2L, 4L, 8L), penalty = "weights",
              weights = c(0.4, 0.3, 0.2, 0.1), sd = 0.5)
## End(No test)              
# with given q
identical(computeBounds(y, q = critVal(100L, alpha = 0.5)), bounds)
identical(computeBounds(y, q = critVal(100L, alpha = 0.5, output = "value")),
          bounds)
## No test: 
# the above calls saved and (attempted to) load Monte-Carlo simulations and
# simulated them for nq = 128 observations
# in the following call no saving, no loading and simulation for n = 100
# observations is required, progress of the simulation will be reported
computeBounds(y, alpha = 0.5, messages = 1000L,
              options = list(simulation = "vector",
                             load = list(), save = list()))
                             
# with given stat to compute q
stat <- monteCarloSimulation(n = 128L)
identical(computeBounds(y, alpha = 0.5, stat = stat),
          computeBounds(y, alpha = 0.5, options = list(load = list())))
## End(No test)


