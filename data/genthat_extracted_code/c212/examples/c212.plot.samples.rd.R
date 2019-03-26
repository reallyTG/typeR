library(c212)


### Name: c212.plot.samples
### Title: Plot Posterior Distribution
### Aliases: c212.plot.samples
### Keywords: c212.plot.samples Bayesian Hierarchy

### ** Examples

## Not run: 
##D data(c212.trial.data)
##D raw = c212.1a(c212.trial.data)
##D sample = raw$theta[,2,2,]
##D c212.plot.samples(sample, sprintf("%s: %s %s", "theta", raw$B[2], raw$AE[2]))
## End(Not run)



