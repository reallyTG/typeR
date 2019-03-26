library(surveillance)


### Name: ks.plot.unif
### Title: Plot the ECDF of a uniform sample with Kolmogorov-Smirnov bounds
### Aliases: ks.plot.unif
### Keywords: hplot htest

### ** Examples

samp <- runif(99)
ks.plot.unif(samp, conf.level=c(0.95, 0.99), exact=TRUE)
ks.plot.unif(samp, conf.level=c(0.95, 0.99), exact=FALSE)



