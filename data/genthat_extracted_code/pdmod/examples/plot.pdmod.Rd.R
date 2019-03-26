library(pdmod)


### Name: plot.pdmod
### Title: Plot model
### Aliases: plot.pdmod

### ** Examples

# Create 5 sessions of 20 rewarded trials,
# then 2 sessions of 20 unrewarded trials
trialTime = as.vector(sapply(0:6, function(x) 1:20 + x * TV_DAY))
trials =  TimedVector(c(rep(1, 5*20), rep(0, 2*20)), trialTime)

estimates = computeModel(trials, mFast = 0.7, mSlow = 0.1, n = 0.05,
						 g = 500, h = 0.2, verbose = TRUE)
plot(estimates, trials)



