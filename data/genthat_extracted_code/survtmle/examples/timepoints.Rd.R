library(survtmle)


### Name: timepoints
### Title: Evaluate Results over Time Points of Interest
### Aliases: timepoints

### ** Examples

# simulate data
set.seed(1234)
n <- 100
ftime <- round(runif(n, 1, 4))
ftype <- round(runif(n, 0, 2))
trt <- rbinom(n, 1, 0.5)
adjustVars <- data.frame(W1 = rnorm(n), W2 = rnorm(n))

# fit an initial survtmle object with t0=max(ftime)
fm <- survtmle(ftime = ftime, ftype = ftype,
               trt = trt, adjustVars = adjustVars,
               glm.trt = "1", glm.ftime = "trt + W1 + W2",
               glm.ctime = "trt + W1 + W2", method="mean",
               returnModels = TRUE)

# call timepoints to get cumulative incidence estimates at each timepoint
allTimes <- timepoints(object = fm, times = 1:4, returnModels = FALSE)

# look at results for time 1
class(allTimes$t1)
allTimes$t1
# look at results for time 2
allTimes$t2




