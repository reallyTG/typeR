library(clampSeg)


### Name: stepDetection
### Title: Detection of steps / jumps by a multiresolution criterion
### Aliases: stepDetection 'detection step' detectionStep
### Keywords: nonparametric

### ** Examples

## fit of the gramicidin A recordings given by gramA
# the used filter
filter <- lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 1e3 / 1e4),
                        sr = 1e4)
## No test: 
# this call requires a Monte-Carlo simulation
# and therefore might last a few minutes,
# progress of the Monte-Carlo simulation is reported
fit <- stepDetection(gramA, filter = filter, startTime = 9, messages = 100)

# this second call should be much faster
# as the previous Monte-Carlo simulation will be loaded
stepDetection(gramA, filter = filter, startTime = 9)

# much larger significance level alpha for a larger detection power,
# but also with the risk of detecting additional artefacts
# in this example much more changes are detected,
# most of them are probably artefacts, but for instance the event at 11.3699
# might be an additional small event that was missed before
stepDetection(gramA, filter = filter, alpha = 0.9, startTime = 9)

# getCritVal was called in stepDetection, can be called explicitly
# for instance outside of a for loop to save computation time
q <- getCritVal(length(gramA), filter = filter)
identical(stepDetection(gramA, q = q, filter = filter, startTime = 9), fit)

# more detailed output
every <- stepDetection(gramA, filter = filter, startTime = 9, output = "every")
identical(every$fit, fit)
identical(every$q, q)
identical(every$sd, stepR::sdrobnorm(gramA, lag = filter$len + 1L))
identical(every$filter, every$filter)

# for this data set no incremental changes occur
identical(every$stepfit, every$stepfit)

## zoom into a single event
time <- 9 + seq(along = gramA) / filter$sr # time points
plot(time, gramA, pch = 16, col = "grey30", ylim = c(20, 50),
     xlim = c(10.40835, 10.4103), ylab = "Conductance in pS", xlab = "Time in s")

# fit is a piecewise constant approximation of the observations
# hence its convolution does not fit the recorded data points appropriately
# for a fit of the observations a deconvolution is required
# either by calling deconvolveLocally additionally or better immediately jules
cps <- fit$leftEnd[8:9]
levels <- fit$value[7:9]
t <- seq(cps[1] - 0.0009, cps[2] + 0.0023, 1e-6)

# fit
lines(t, ifelse(t < cps[1], rep(levels[1], length(t)),
                ifelse(t < cps[2], rep(levels[2], length(t)),
                       rep(levels[3], length(t)))),
      col = "blue", lwd = 3)

# fit convolved with the filter
lines(t, levels[1] * (1 - filter$truncatedStepfun(t - cps[1])) + 
        levels[2] * (filter$truncatedStepfun(t - cps[1]) - 
                       filter$truncatedStepfun(t - cps[2])) + 
        levels[3] * filter$truncatedStepfun(t - cps[2]),
      col = "darkblue", lwd = 3)


# fit with a wrong filter
wrongFilter <- lowpassFilter(type = "bessel",
                             param = list(pole = 6L, cutoff = 0.2),
                             sr = 1e4)
                             
# Monte-Carlo simulation depend on the number of observations and on the filter
# hence a simulation is required again (if called for the first time)
# to save some time the number of iterations is reduced to r = 1e3
# hence the critical value is computed with less precision
# In general, r = 1e3 is enough for a first impression
# for a detailed analysis r = 1e4 is suggested
stepDetection(gramA, filter = filter, startTime = 9, messages = 100L, r = 1e3L)

# simulation for a larger number of observations can be used (nq = 3e4)
# does not require a new simulation as the simulation from above will be used
# (if the previous call was executed first)
stepDetection(gramA, filter = filter, startTime = 9,
              messages = 100L, r = 1e3L, nq = 3e4L)
              
# simulation of type "vectorIncreased" for n1 observations can only be reused 
# for n2 observations if as.integer(log2(n1)) == as.integer(log2(n2))
# no simulation is required, since a simulation of type "matrixIncreased"
# will be loaded from the fileSystem
# this call also saves a simulation of type "vectorIncreased" in the workspace 
stepDetection(gramA[1:1e4], filter = filter, startTime = 9,
      nq = 3e4, messages = 100, r = 1e3)
# here a new simulation is required
# (if no appropriate simulation is saved from a call outside of this file)
stepDetection(gramA[1:1e3], filter = filter, startTime = 9,
      nq = 3e4, messages = 100, r = 1e3,
      options = list(load = list(workspace = c("vector", "vectorIncreased"))))              

# the above calls saved and (attempted to) load Monte-Carlo simulations
# in the following call the simulations will neither be saved nor loaded
stepDetection(gramA, filter = filter, startTime = 9, messages = 100L, r = 1e3L,
              options = list(load = list(), save = list()))

# only simulations of type "vector" and "vectorInceased" will only be in and
# loaded from the workspace, but no simulations of type "matrix" and
# "matrixIncreased" on the file system
stepDetection(gramA, filter = filter, startTime = 9, messages = 100L, r = 1e3L,
              options = list(load = list(workspace = c("vector", "vectorIncreased")),
                             save = list(workspace = c("vector", "vectorIncreased"))))

# explicit Monte-Carlo simulations, not recommended
stat <- stepR::monteCarloSimulation(n = length(gramA), , family = "mDependentPS",
                                    filter = filter, output = "maximum",
                                    r = 1e3, messages = 100)
stepDetection(gramA, filter = filter, startTime = 9, stat = stat)

# with given standard deviation
sd <- stepR::sdrobnorm(gramA, lag = filter$len + 1)
identical(stepDetection(gramA, filter = filter, startTime = 9, sd = sd), fit)
## End(No test)


