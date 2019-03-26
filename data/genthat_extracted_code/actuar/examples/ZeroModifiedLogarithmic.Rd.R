library(actuar)


### Name: ZeroModifiedLogarithmic
### Title: The Zero-Modified Logarithmic Distribution
### Aliases: ZeroModifiedLogarithmic ZMLogarithmic dzmlogarithmic
###   pzmlogarithmic qzmlogarithmic rzmlogarithmic
### Keywords: distribution

### ** Examples

p <- 1/(1 + 0.5)
dzmlogarithmic(1:5, prob = p, p0 = 0.6)
(1-0.6) * dlogarithmic(1:5, p)/plogarithmic(0, p, lower = FALSE) # same

## simple relation between survival functions
pzmlogarithmic(0:5, p, p0 = 0.2, lower = FALSE)
(1-0.2) * plogarithmic(0:5, p, lower = FALSE)/plogarithmic(0, p, lower = FALSE) # same

qzmlogarithmic(pzmlogarithmic(0:10, 0.3, p0 = 0.6), 0.3, p0 = 0.6)



