library(stepR)


### Name: critVal
### Title: Critical values
### Aliases: critVal
### Keywords: nonparametric

### ** Examples

# vector of critical values
qVector <- critVal(100L, alpha = 0.5)
# global quantile
qValue <- critVal(100L, alpha = 0.5, output = "value")

# vector can be computed from the global quantile
identical(critVal(100L, q = qValue), qVector)

# for a conservative significance level, stronger confidence statements
critVal(100L, alpha = 0.05)
critVal(100L, alpha = 0.05, output = "value")

# higher significance level for larger detection power, but less confidence
critVal(100L, alpha = 0.99)
critVal(100L, alpha = 0.99, output = "value")
## No test: 
# different parametric family, different intervalSystem, a subset of lengths,
# different penalty and given weights
q <- critVal(100L, alpha = 0.05, family = "hsmuce", intervalSystem = "dyaLen",
             lengths = c(2L, 4L, 16L, 32L), penalty = "weights",
             weights = c(0.4, 0.3, 0.2, 0.1))

# vector of critical values can be given by a vector of length n
vec <- 1:100
vec[c(2L, 4L, 16L, 32L)] <- q
attr(vec, "n") <- 128L
identical(critVal(100L, q = vec, family = "hsmuce", intervalSystem = "dyaLen",
                  lengths = c(2L, 4L, 16L, 32L)), q)

# with a given monte-Carlo simulation for nq = 128 observations
stat <- monteCarloSimulation(128)
critVal(n = 100L, alpha = 0.05, stat = stat)

# the above calls saved and (attempted to) load Monte-Carlo simulations and
# simulated them for nq = 128 observations
# in the following call no saving, no loading and simulation for n = 100
# observations is required, progress of the simulation will be reported
critVal(n = 100L, alpha = 0.05, messages = 1000L,
        options = list(simulation = "vector", load = list(), save = list()))

# only type "vector" will be saved and loaded in the workspace
critVal(n = 100L, alpha = 0.05, messages = 1000L,
        options = list(simulation = "vector", load = list(workspace = "vector"),
                       save = list(workspace = "vector")))

# simulation of type "matrix" will be saved in a RDS file and in a variable
# saving of type "vector" is disabled by passing "",
# different seed is set and number of simulations is reduced to r = 1e3
# to allow faster computation at the price of a less precise result
file <- tempfile(pattern = "file", tmpdir = tempdir(), fileext = ".RDS")
critVal(n = 100L, alpha = 0.05, seed = 1, r = 1e3,
        options = list(simulation = "matrix", load = list(),
          save = list(variable = c("", "test"), RDSfile = c("", file))))
identical(test, monteCarloSimulation(100L, seed = 1, r = 1e3))
identical(readRDS(file), monteCarloSimulation(100L, seed = 1, r = 1e3))
## End(No test)


