library(TPmsm)


### Name: dgpTP
### Title: Generates bivariate survival data
### Aliases: dgpTP
### Keywords: datagen distribution multivariate survival

### ** Examples

# Set the number of threads
nth <- setThreadsTP(2)

# Example for the bivariate Exponential distribution
dgpTP(n=100, corr=1, dist="exponential", dist.par=c(1, 1),
model.cens="uniform", cens.par=3, state2.prob=0.5)

# Example for the bivariate Weibull distribution
dgpTP(n=100, corr=1, dist="weibull", dist.par=c(2, 7, 2, 7),
model.cens="exponential", cens.par = 6, state2.prob=0.6)

# Restore the number of threads
setThreadsTP(nth)



