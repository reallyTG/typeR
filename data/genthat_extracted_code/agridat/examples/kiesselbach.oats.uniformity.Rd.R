library(agridat)


### Name: kiesselbach.oats.uniformity
### Title: Uniformity trial of oats
### Aliases: kiesselbach.oats.uniformity
### Keywords: datasets

### ** Examples

## Not run: 
##D   
##D   data(kiesselbach.oats.uniformity)
##D   dat <- kiesselbach.oats.uniformity
##D   
##D   range(dat$yield) # 56.7 92.8 match Kiesselbach p 64.
##D 
##D   require(desplot)
##D   desplot(yield ~ col*row, dat,
##D           tick=TRUE, flip=TRUE, aspect=792/469, # true aspect
##D           main="kiesselbach.oats.uniformity")
##D   
## End(Not run)



