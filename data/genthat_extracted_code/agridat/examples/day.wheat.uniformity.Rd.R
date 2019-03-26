library(agridat)


### Name: day.wheat.uniformity
### Title: Uniformity trial of wheat
### Aliases: day.wheat.uniformity
### Keywords: datasets

### ** Examples

## Not run: 
##D   
##D   data(day.wheat.uniformity)
##D   dat <- day.wheat.uniformity
##D 
##D   require(desplot)
##D   desplot(grain~col*row, data=dat,
##D           flip=TRUE, aspect=(100*8)/(155*12), # true aspect
##D           main="day.wheat.uniformity - grain yield")
##D   
##D   # similar to Day table IV
##D   require(lattice)
##D   xyplot(grain~straw, data=dat, main="day.wheat.uniformity", type=c('p','r'))
##D   # cor(dat$grain, dat$straw) # .9498 # Day calculated 0.9416
##D   
##D   require(desplot)
##D   desplot(straw~col*row, data=dat,
##D           flip=TRUE, aspect=(100*8)/(155*12), # true aspect
##D           main="day.wheat.uniformity - straw yield")
##D   
##D   # Day fig 2
##D   coldat <- aggregate(grain~col, dat, sum) 
##D   xyplot(grain ~ col, coldat, type='l', ylim=c(2500,6500))
##D   dat$rowgroup <- round((dat$row +1)/3,0)
##D   rowdat <- aggregate(grain~rowgroup, dat, sum) 
##D   xyplot(grain ~ rowgroup, rowdat, type='l', ylim=c(2500,6500))
##D 
## End(Not run)  



