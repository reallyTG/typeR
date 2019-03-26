library(SimMultiCorrData)


### Name: cdf_prob
### Title: Calculate Theoretical Cumulative Probability for Continuous
###   Variables
### Aliases: cdf_prob
### Keywords: cumulative, probability statistics, theoretical,

### ** Examples

# Normal distribution with Headrick's fifth-order PMT:
cdf_prob(c = c(0, 1, 0, 0, 0, 0), "Polynomial", delta = qnorm(0.05))

## Not run: 
##D # Beta(a = 4, b = 2) Distribution:
##D con <- find_constants(method = "Polynomial", skews = -0.467707, skurts = -0.375,
##D                       fifths = 1.403122, sixths = -0.426136)$constants
##D cdf_prob(c = con, method = "Polynomial", delta = 0.5)
## End(Not run)



