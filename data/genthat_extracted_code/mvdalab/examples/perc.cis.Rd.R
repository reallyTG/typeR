library(mvdalab)


### Name: perc.cis
### Title: Percentile Bootstrap Confidence Intervals
### Aliases: perc.cis

### ** Examples

data(Penta)
## Number of bootstraps set to 250 to demonstrate flexibility
## Use a minimum of 1000 (default) for results that support bootstraping
mod1 <- plsFit(log.RAI ~., scale = TRUE, data = Penta[, -1], 
               ncomp = 2, validation = "oob", boots = 250)
perc.cis(mod1, ncomp = 1:2, conf = .95, type = "coefficients")



