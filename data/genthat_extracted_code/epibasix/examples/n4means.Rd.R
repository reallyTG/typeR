library(epibasix)


### Name: n4means
### Title: Number of Subjects Required for a Randomized Trial with a
###   Continuous Outcome
### Aliases: n4means print.n4means summary.n4means
### Keywords: design

### ** Examples

## Not run: 
##D Suppose we wish to test whether a blood pressure medication reduces diastolic blood
##D pressure by 10 mm Hg, at standard significance and power, assume the standard deviation is 10 mm Hg.
## End(Not run)
n4means(delta=10, sigma=10, alpha=0.05, power=0.80);



