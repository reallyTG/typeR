library(agridat)


### Name: iyer.wheat.uniformity
### Title: Uniformity trials of wheat in India
### Aliases: iyer.wheat.uniformity
### Keywords: datasets

### ** Examples

## Not run: 
##D   
##D   data(iyer.wheat.uniformity)
##D   dat <- iyer.wheat.uniformity
##D 
##D   require(desplot)
##D   desplot(yield ~ col*row, data=dat,
##D           main="iyer.wheat.uniformity", tick=TRUE, 
##D           aspect=(25*5)/(80*5)) # true aspect
##D 
##D   # not exactly the same as Iyer table 1, p. 241
##D   var(subset(dat, col <= 20)$yield)
##D   var(subset(dat, col > 20 & col <= 40)$yield)
##D   var(subset(dat, col > 40 & col <= 60)$yield)
##D   var(subset(dat, col > 60)$yield)
##D   
##D   # cv for 1x1 whole-field
##D   # sd(dat$yield)/mean(dat$yield)
##D   # 18.3
##D 
## End(Not run)



