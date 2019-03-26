library(TPmsm)


### Name: setSeedTP
### Title: Save and restore RNG stream seeds
### Aliases: setSeedTP
### Keywords: environment utilities

### ** Examples

# Set the number of threads
nth <- setThreadsTP(2)

# Generate bivariate survival data
survTP0 <- dgpTP(n=100, corr=1, dist="weibull", dist.par=c(2, 7, 2, 7),
model.cens="exponential", cens.par = 6, state2.prob=0.6)

# Save seed
seed <- setSeedTP()

# Generate bivariate survival data
survTP1 <- dgpTP(n=100, corr=1, dist="weibull", dist.par=c(2, 7, 2, 7),
model.cens="exponential", cens.par = 6, state2.prob=0.6)

# The objects should be different
all.equal(survTP0, survTP1)

# Restore seed
setSeedTP(seed)

# Generate bivariate survival data
survTP2 <- dgpTP(n=100, corr=1, dist="weibull", dist.par=c(2, 7, 2, 7),
model.cens="exponential", cens.par = 6, state2.prob=0.6)

# Both objects were computed from the same seed and should be equal
all.equal(survTP1, survTP2)

# Restore the number of threads
setThreadsTP(nth)



