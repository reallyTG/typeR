library(jocre)


### Name: helpers
### Title: Different generic functions for classes 'JOC' and 'JOCMV'
### Aliases: plot.JOC print.JOC summary.JOC plot.JOCMV print.JOCMV
###   summary.JOCMV
### Keywords: classes

### ** Examples

## Not run: 
##D # Example 1: simultaneous 90% confidence region for bivariate data
##D 
##D bivar <- mvtnorm::rmvnorm(n=100, mean=rep(0.05, 2), sigma=diag(2) * 0.05)
##D 
##D hotelling <- cset(dat=bivar, method="hotelling", alpha=0.1)
##D summary(hotelling)
##D plot(hotelling, main="90% Hotelling Region")
##D 
##D # Example 2: simultaneous 90% confidence region for the mean and variance of univariate normal data
##D 
##D univar <- rnorm(n=50)
##D 
##D moodvar <- csetMV(dat=univar, method="mood", alpha=0.1, scale="var")
##D summary(moodvar)
##D plot(moodvar, main="90% Mood Region")
## End(Not run)



