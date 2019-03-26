library(lessR)


### Name: simMeans
### Title: Pedagogical Simulation of Sample Means over Repeated Samples
### Aliases: simMeans
### Keywords: confidence interval

### ** Examples

# 8 samples, each with a sample size of 10
# mu=0, sigma=1, that is, sample from the standard normal
simMeans(8, 10)

# 25 sample means with a sample size each of 100
# mu=100, sigma=15
# pause after each interval and show the data
simMeans(25, 100, mu=100, sigma=15, show.data=FALSE)



