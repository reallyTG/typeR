library(crossrun)


### Name: simclbin
### Title: Simulation of Independent Bernoulli Observations
### Aliases: simclbin

### ** Examples

cl30simbin <- simclbin(nser=30, nsim=100)
mean(cl30simbin$nc0.5) # mean number of crossings, p=0.5
mean(cl30simbin$lr0.9) # mean longest run, p=0.9



