library(agridat)


### Name: strickland.peach.uniformity
### Title: Uniformity trial of peach
### Aliases: strickland.peach.uniformity
### Keywords: datasets

### ** Examples

## Not run: 
##D 
##D   data(strickland.peach.uniformity)
##D   dat <- strickland.peach.uniformity
##D 
##D   mean(dat$yield) # 131.3, Strickland has 131.3
##D   sd(dat$yield)/mean(dat$yield) # 31.1, Strickland has 34.4
##D 
##D   require(desplot)
##D   desplot(yield ~ col*row, dat,
##D           main="strickland.peach.uniformity",
##D           flip=TRUE, aspect=1)
## End(Not run)



