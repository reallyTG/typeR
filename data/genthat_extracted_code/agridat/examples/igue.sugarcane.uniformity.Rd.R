library(agridat)


### Name: igue.sugarcane.uniformity
### Title: Uniformity trial with sugarcane
### Aliases: igue.sugarcane.uniformity
### Keywords: datasets

### ** Examples

## Not run: 
##D   
##D   data(igue.sugarcane.uniformity)
##D   dat <- igue.sugarcane.uniformity
##D 
##D   # match Igue CV top row of page 171
##D   sd(dat$yield)/mean(dat$yield) # 16.4
##D 
##D   require(desplot)
##D   desplot(yield ~ col*row, dat,
##D           flip=TRUE, tick=TRUE, aspect=(42*2)/(36*1.5),
##D           main="igue.sugarcane.uniformity")
##D   
## End(Not run)  



