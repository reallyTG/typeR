library(pulsar)


### Name: getLamPath
### Title: Lambda path
### Aliases: getLamPath

### ** Examples

## Generate the data with huge:
library(huge)
set.seed(10010)
p <- 40 ; n <- 100
dat   <- huge.generator(n, p, "hub", verbose=FALSE, v=.1, u=.3)

## Theoretical lamda max is the maximum abs value of the empirical covariance matrix
maxCov <- getMaxCov(dat$data)
lams   <- getLamPath(maxCov, 5e-2*maxCov, len=40)




