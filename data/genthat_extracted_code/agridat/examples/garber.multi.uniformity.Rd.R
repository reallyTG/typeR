library(agridat)


### Name: garber.multi.uniformity
### Title: Uniformity trials of oat hay and wheat grain
### Aliases: garber.multi.uniformity
### Keywords: datasets

### ** Examples

## Not run: 
##D   
##D   data(garber.multi.uniformity)
##D   dat <- garber.multi.uniformity
##D 
##D   require(desplot)
##D   desplot(oats ~ col*row, data=dat,
##D           flip=TRUE, tick=TRUE, aspect=945/436, # true aspect
##D           main="garber.multi.uniformity oats")
##D 
##D   desplot(wheat ~ col*row, data=dat,
##D           flip=TRUE, tick=TRUE, aspect=945/436, # true aspect
##D           main="garber.multi.uniformity wheat")
##D 
##D   with(dat, cor(oats, wheat)) # = .37 matches Garber
##D 
## End(Not run)  



