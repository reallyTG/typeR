library(flexsurv)


### Name: Survspline
### Title: Royston/Parmar spline survival distribution
### Aliases: Hsurvspline Survspline dsurvspline hsurvspline mean_survspline
###   psurvspline qsurvspline rmst_survspline rsurvspline
### Keywords: distribution

### ** Examples


## reduces to the weibull
regscale <- 0.786; cf <- 1.82
a <- 1/regscale; b <- exp(cf)
dweibull(1, shape=a, scale=b)
dsurvspline(1, gamma=c(log(1 / b^a), a)) # should be the same

## reduces to the log-normal
meanlog <- 1.52; sdlog <- 1.11
dlnorm(1, meanlog, sdlog) 
dsurvspline(1, gamma = c(-meanlog/sdlog, 1/sdlog), scale="normal")
# should be the same



