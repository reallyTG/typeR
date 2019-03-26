library(mvdalab)


### Name: bca.cis
### Title: Bias-corrected and Accelerated Confidence Intervals
### Aliases: bca.cis

### ** Examples

data(Penta)
## Number of bootstraps set to 250 to demonstrate flexibility
## Use a minimum of 1000 (default) for results that support bootstraping
mod1 <- plsFit(log.RAI ~., scale = TRUE, data = Penta[, -1],
               ncomp = 2, validation = "oob", boots = 250)
bca.cis(mod1, conf = .95, type = "coefficients")
## Not run: 
##D bca.cis(mod1, conf = .95, type = "loadings")
##D bca.cis(mod1, conf = .95, type = "weights")
## End(Not run)



