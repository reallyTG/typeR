library(lessR)


### Name: simCImean
### Title: Pedagogical Simulation for the Confidence Interval of the Mean
### Aliases: simCImean
### Keywords: confidence interval

### ** Examples

# 25 confidence intervals with a sample size each of 100
# mu=0, sigma=1, that is, sample from the standard normal
simCImean(25, 100)

# 25 confidence intervals with a sample size each of 100
# mu=100, sigma=15
# pause after each interval and show the data
simCImean(25, 100, mu=100, sigma=15, show.data=TRUE)



