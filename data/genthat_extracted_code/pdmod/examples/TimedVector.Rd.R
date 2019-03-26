library(pdmod)


### Name: TimedVector
### Title: Create a TimedVector
### Aliases: TimedVector

### ** Examples

# One session of 20 rewarded trials every minute
TimedVector(rep(1, 20), 1:20)

# Three sessions of rewarded trials, then one session of non-rewarded trials,
# with trials every 2 min and sessions every day
trialTime = as.vector(sapply(0:3, function(x) seq(2, 20, 2) + x * TV_DAY))
TimedVector(c(rep(1, 30), rep(0, 10)), trialTime)

# The above schedule of sessions, but 50% probability of reward
TimedVector(sample(0:1, 40, replace = TRUE), trialTime)



