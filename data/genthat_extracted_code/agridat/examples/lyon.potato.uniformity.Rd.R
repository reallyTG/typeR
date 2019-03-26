library(agridat)


### Name: lyon.potato.uniformity
### Title: Uniformity trial of potatoes
### Aliases: lyon.potato.uniformity
### Keywords: datasets

### ** Examples

## Not run: 
##D   
##D   data(lyon.potato.uniformity)
##D   dat <- lyon.potato.uniformity
##D 
##D   # Yield per square foot, assuming 72 foot rows
##D   sum(dat$yield)/(72*96) # 0.67 # seems about right
##D   # Yield per square foot, assuming 72 foot plots
##D   sum(dat$yield)/(6*72*96) # 0.11
##D   
##D   require(desplot)
##D   desplot(yield ~ col*row, dat,
##D           tick=TRUE, flip=TRUE, aspect=96/72, # true aspect
##D           main="lyon.potato.uniformity")
##D   
## End(Not run)



