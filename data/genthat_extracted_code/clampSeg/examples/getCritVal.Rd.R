library(clampSeg)


### Name: getCritVal
### Title: Critical value
### Aliases: getCritVal
### Keywords: nonparametric

### ** Examples

# the for the recording of the gramA data set used filter
filter <- lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 1e3 / 1e4),
                        sr = 1e4)
## No test: 
# critical value for jules or stepDetection
# this call requires a Monte-Carlo simulation at the first time
# and therefore might last a few minutes,
# progress of the Monte-Carlo simulation is reported
q <- getCritVal(length(gramA), filter = filter, messages = 100)

# this second call should be much faster
# as the previous Monte-Carlo simulation will be loaded
getCritVal(length(gramA), filter = filter)

# much larger significance level alpha for a larger detection power,
# but also with the risk of detecting additional artefacts
getCritVal(length(gramA), filter = filter, alpha = 0.9)

# medium significance level alpha for a tradeoff between detection power
# and the risk to detect additional artefacts
getCritVal(length(gramA), filter = filter, alpha = 0.5)
## End(No test)

# critical values depend on the number of observations and on the filter
# also a new Monte-Carlo simulation is required
getCritVal(100, filter = filter, messages = 500)
## No test: 
otherFilter <- lowpassFilter(type = "bessel",
                             param = list(pole = 6L, cutoff = 0.2),
                             sr = 1e4)
getCritVal(100, filter = otherFilter, messages = 500)

# simulation for a larger number of oberservations can be used (nq = 100)
# does not require a new simulation as the simulation from above will be used
# (if the previous call was executed first)
getCritVal(90, filter = filter, nq = 100)

# simulation of type "vectorIncreased" for n1 observations can only be reused 
# for n2 observations if as.integer(log2(n1)) == as.integer(log2(n2))
# no simulation is required, since a simulation of type "matrixIncreased"
# will be loaded from the fileSystem
# this call also saved a simulation of type "vectorIncreased" in the workspace
getCritVal(30, filter = filter, nq = 100)
# here a new simulation is required
# (if no appropriate simulation is saved from a call outside of this file)
getCritVal(10, filter = filter, nq = 100, messages = 500,
           options = list(load = list(workspace = c("vector", "vectorIncreased")))) 

# the above calls saved and (attempted to) load Monte-Carlo simulations
# in the following call the simulations will neither be saved nor loaded
# to save some time the number of iterations is reduced to r = 1e3
# hence the critical value is computed with less precision
# In general, r = 1e3 is enough for a first impression
# for a detailed analysis r = 1e4 is suggested
getCritVal(100, filter = filter, messages = 100, r = 1e3,
           options = list(load = list(), save = list()))

# simulations will only be saved in and loaded from the workspace,
# but not on the file system
getCritVal(100, filter = filter, messages = 100, r = 1e3,
           options = list(load = list(workspace = c("vector", "vectorIncreased")),
                          save = list(workspace = c("vector", "vectorIncreased"))))

# explicit Monte-Carlo simulations, not recommended
stat <- stepR::monteCarloSimulation(n = 100, , family = "mDependentPS",
                                    filter = filter, output = "maximum",
                                    r = 1e3, messages = 100)
getCritVal(100, filter = filter, stat = stat)
## End(No test)


