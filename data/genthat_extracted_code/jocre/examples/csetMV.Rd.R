library(jocre)


### Name: csetMV
### Title: Confidence regions and intervals for a normal mean and variance
### Aliases: csetMV
### Keywords: multivariate

### ** Examples

## Not run: 
##D # Simultaneous 90% confidence regions for the mean and variance or sd of univariate normal data
##D 
##D univar <- rnorm(n=50)
##D 
##D moodvar <- csetMV(dat=univar, method="mood", alpha=0.1, scale="var")
##D summary(moodvar)
##D plot(moodvar)
##D 
##D moodsd <- csetMV(dat=univar, method="mood", alpha=0.1, scale="sd")
##D summary(moodsd)
##D plot(moodsd)
## End(Not run)



