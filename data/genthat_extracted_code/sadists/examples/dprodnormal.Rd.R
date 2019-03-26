library(sadists)


### Name: prodnormal
### Title: The product of normal random variates.
### Aliases: dprodnormal pprodnormal prodnormal qprodnormal rprodnormal
### Keywords: distribution

### ** Examples

mu <- c(100,20,10)
sigma <- c(10,50,10)
rvs <- rprodnormal(128, mu, sigma)
dvs <- dprodnormal(rvs, mu, sigma)
qvs <- pprodnormal(rvs, mu, sigma)
pvs <- qprodnormal(ppoints(length(rvs)), mu, sigma)



