library(fitdistrplus)


### Name: bootdistcens
### Title: Bootstrap simulation of uncertainty for censored data
### Aliases: bootdistcens plot.bootdistcens print.bootdistcens
###   summary.bootdistcens
### Keywords: distribution

### ** Examples

# We choose a low number of bootstrap replicates in order to satisfy CRAN running times
# constraint.
# For practical applications, we recommend to use at least niter=501 or niter=1001.

# (1) Fit of a normal distribution to fluazinam data in log10
# followed by nonparametric bootstrap and calculation of quantiles
# with 95 percent confidence intervals
#
data(fluazinam)
(d1 <-log10(fluazinam))
f1 <- fitdistcens(d1, "norm")
b1 <- bootdistcens(f1, niter = 101)
b1
summary(b1)
plot(b1)
quantile(b1)
CIcdfplot(b1, CI.output = "quantile")

# (2) Estimation of the mean of the normal distribution 
# by maximum likelihood with the standard deviation fixed at 1 
# using the argument fix.arg
# followed by nonparametric bootstrap 
# and calculation of quantiles with 95 percent confidence intervals
#
f1b <- fitdistcens(d1, "norm", start = list(mean = 1),fix.arg = list(sd = 1))
b1b <- bootdistcens(f1b, niter = 101)
summary(b1b)
plot(b1b)
quantile(b1b)

# (3) comparison of sequential and parallel versions of bootstrap
# to be tried with a greater number of iterations (1001 or more)
#
## Not run: 
##D niter <- 1001
##D data(fluazinam)
##D d1 <-log10(fluazinam)
##D f1 <- fitdistcens(d1, "norm")
##D 
##D # sequential version
##D ptm <- proc.time()
##D summary(bootdistcens(f1, niter = niter))
##D proc.time() - ptm
##D 
##D # parallel version using snow
##D require(parallel)
##D ptm <- proc.time()
##D summary(bootdistcens(f1, niter = niter, parallel = "snow", ncpus = 4))
##D proc.time() - ptm
##D 
##D # parallel version using multicore (not available on Windows)
##D ptm <- proc.time()
##D summary(bootdistcens(f1, niter = niter, parallel = "multicore", ncpus = 4))
##D proc.time() - ptm
## End(Not run)




