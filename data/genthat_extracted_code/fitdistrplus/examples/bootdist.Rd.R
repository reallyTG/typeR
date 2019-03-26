library(fitdistrplus)


### Name: bootdist
### Title: Bootstrap simulation of uncertainty for non-censored data
### Aliases: bootdist plot.bootdist print.bootdist summary.bootdist
### Keywords: distribution

### ** Examples

# We choose a low number of bootstrap replicates in order to satisfy CRAN running times
# constraint.
# For practical applications, we recommend to use at least niter=501 or niter=1001.


# (1) Fit of a gamma distribution to serving size data
# using default method (maximum likelihood estimation)
# followed by parametric bootstrap
#
data(groundbeef)
x1 <- groundbeef$serving
f1 <- fitdist(x1, "gamma")
b1 <- bootdist(f1, niter=51)
print(b1)
plot(b1)
plot(b1, enhance=TRUE)
summary(b1)
quantile(b1)
CIcdfplot(b1, CI.output = "quantile")

# (2) non parametric bootstrap on the same fit
#
b1b <- bootdist(f1, bootmethod="nonparam", niter=51) 
summary(b1b)
quantile(b1b)


# (3) Fit of a normal distribution on acute toxicity values of endosulfan in log10 for
# nonarthropod invertebrates, using maximum likelihood estimation
# to estimate what is called a species sensitivity distribution 
# (SSD) in ecotoxicology, followed by estimation of the 5 percent quantile value of 
# the fitted distribution, what is called the 5 percent hazardous concentration (HC5)
# in ecotoxicology, with its two-sided 95 percent confidence interval calculated by 
# parametric bootstrap
#
data(endosulfan)
ATV <- subset(endosulfan, group == "NonArthroInvert")$ATV
log10ATV <- log10(subset(endosulfan, group == "NonArthroInvert")$ATV)
fln <- fitdist(log10ATV, "norm")
bln <- bootdist(fln, bootmethod = "param", niter=51)
quantile(bln, probs = c(0.05, 0.1, 0.2))

# (4) comparison of sequential and parallel versions of bootstrap
# to be tried with a greater number of iterations (1001 or more)
#
## Not run: 
##D niter <- 1001
##D data(groundbeef)
##D x1 <- groundbeef$serving
##D f1 <- fitdist(x1, "gamma")
##D 
##D # sequential version
##D ptm <- proc.time()
##D summary(bootdist(f1, niter = niter))
##D proc.time() - ptm
##D 
##D # parallel version using snow
##D require(parallel)
##D ptm <- proc.time()
##D summary(bootdist(f1, niter = niter, parallel = "snow", ncpus = 4))
##D proc.time() - ptm
##D 
##D # parallel version using multicore (not available on Windows)
##D ptm <- proc.time()
##D summary(bootdist(f1, niter = niter, parallel = "multicore", ncpus = 4))
##D proc.time() - ptm
## End(Not run)




