library(actuar)


### Name: ZeroModifiedPoisson
### Title: The Zero-Modified Poisson Distribution
### Aliases: ZeroModifiedPoisson ZMpoisson dzmpois pzmpois qzmpois rzmpois
### Keywords: distribution

### ** Examples

dzmpois(0:5, lambda = 1, p0 = 0.2)
(1-0.2) * dpois(0:5, lambda = 1)/ppois(0, 1, lower = FALSE) # same

## simple relation between survival functions
pzmpois(0:5, 1, p0 = 0.2, lower = FALSE)
(1-0.2) * ppois(0:5, 1, lower = FALSE) /
    ppois(0, 1, lower = FALSE) # same

qzmpois(pzmpois(0:10, 1, p0 = 0.7), 1, p0 = 0.7)



