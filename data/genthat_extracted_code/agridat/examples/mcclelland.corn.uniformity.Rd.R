library(agridat)


### Name: mcclelland.corn.uniformity
### Title: Uniformity trial of corn
### Aliases: mcclelland.corn.uniformity
### Keywords: datasets

### ** Examples

## Not run: 
##D 
##D   data(mcclelland.corn.uniformity)
##D   dat <- mcclelland.corn.uniformity
##D   
##D   # McClelland table 3, first row, gives 11.2##D 
##D   # Probable error = 0.67449 * sd(). Relative to mean.
##D   0.67449 * sd(dat$yield)/mean(dat$yield) # 11.2##D 
##D   
##D   require(desplot)
##D   desplot(yield ~ col*row, dat,
##D           flip=TRUE,
##D           aspect=(219*44/12)/132, # true aspect, 219 rows * 44 inches x 132 feet
##D           main="mcclelland.corn.uniformity")
##D   
## End(Not run)



