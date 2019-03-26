library(agridat)


### Name: goulden.barley.uniformity
### Title: Uniformity trial of barley
### Aliases: goulden.barley.uniformity
### Keywords: datasets

### ** Examples

## Not run: 
##D   
##D   data(goulden.barley.uniformity)
##D   dat <- goulden.barley.uniformity
##D 
##D   require(desplot)
##D   desplot(yield ~ col*row, data=dat,
##D           aspect=20/20, # true aspect
##D           main="goulden.barley.uniformity")
##D 
##D   # Left skewed distribution. See LeClerg, Leonard, Clark
##D   hist(dat$yield, main="goulden.barley.uniformity",
##D        breaks=c(21,40,59,78,97,116,135,154,173,192,211,230,249)+.5)
##D 
## End(Not run)  



