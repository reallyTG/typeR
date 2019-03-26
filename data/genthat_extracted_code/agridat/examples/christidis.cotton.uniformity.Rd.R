library(agridat)


### Name: christidis.cotton.uniformity
### Title: Uniformity trial of cotton
### Aliases: christidis.cotton.uniformity
### Keywords: datasets

### ** Examples

## Not run: 
##D   
##D   data(christidis.cotton.uniformity)
##D   dat <- christidis.cotton.uniformity
##D   
##D   # Match the mean yields in table 2. Not sure why '16' is needed
##D   sapply(split(dat$yield, dat$block), mean)*16
##D   
##D   require(desplot)
##D   dat$yld <- dat$yield/4*1000 # re-scale to match Fig 1
##D   desplot(yld ~ col*row|block, data=dat,
##D           flip=TRUE, aspect=(16)/(64),
##D           main="christidis.cotton.uniformity")
##D 
## End(Not run)  



