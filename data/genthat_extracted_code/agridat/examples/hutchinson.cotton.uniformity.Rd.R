library(agridat)


### Name: hutchinson.cotton.uniformity
### Title: Uniformity trial of cotton
### Aliases: hutchinson.cotton.uniformity
### Keywords: datasets

### ** Examples

## Not run: 
##D   
##D   data(hutchinson.cotton.uniformity)
##D   dat <- hutchinson.cotton.uniformity
##D   
##D   # match the CV of Panse
##D   # sd(dat$yield)/mean(dat$yield) * 100
##D   # 32.1
##D   
##D   # match the fertility map of Hutchinson, fig 1
##D   require(desplot)
##D   desplot(yield ~ col*row, dat,
##D           flip=TRUE, aspect=207/150, # true aspect
##D           main="hutchinson.cotton.uniformity")
##D 
## End(Not run)  



