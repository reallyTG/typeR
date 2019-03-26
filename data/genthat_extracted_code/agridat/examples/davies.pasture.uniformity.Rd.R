library(agridat)


### Name: davies.pasture.uniformity
### Title: Uniformity trial of pasture.
### Aliases: davies.pasture.uniformity
### Keywords: datasets

### ** Examples

## Not run: 
##D 
##D   data(davies.pasture.uniformity)
##D   dat <- davies.pasture.uniformity
##D   
##D   # range(dat$yield) # match Davies
##D   # mean(dat$yield) # 227.77, Davies has 221.7
##D   # sd(dat$yield)/mean(dat$yield) # 33.9, Davies has 32.5
##D 
##D   # require(lattice)
##D   # qqmath( ~ yield, dat) # clearly non-normal, skewed right
##D 
##D   require(desplot)
##D   desplot(yield ~ col*row, dat,
##D           flip=TRUE, aspect=(40*5)/(19*10), # true aspect
##D           main="davies.pasture.uniformity") 
##D 
## End(Not run)



