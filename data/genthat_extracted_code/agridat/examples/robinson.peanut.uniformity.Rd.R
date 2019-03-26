library(agridat)


### Name: robinson.peanut.uniformity
### Title: Uniformity trial of peanuts
### Aliases: robinson.peanut.uniformity
### Keywords: datasets

### ** Examples

## Not run: 
##D 
##D   data(robinson.peanut.uniformity)
##D   dat <- robinson.peanut.uniformity
##D 
##D   # Mean yield per year. Robinson has 703.9, 787.3
##D   # tapply(dat$yield, dat$year, mean)
##D   #     1939     1940 
##D   # 703.7847 787.8125 
##D   
##D   require(desplot)
##D   desplot(yield ~ col*row|year, dat,
##D           flip=TRUE, tick=TRUE, aspect=200/48,
##D           main="robinson.peanut.uniformity")
##D   
## End(Not run)



