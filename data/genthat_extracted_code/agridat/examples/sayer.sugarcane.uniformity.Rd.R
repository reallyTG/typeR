library(agridat)


### Name: sayer.sugarcane.uniformity
### Title: Uniformity trial of sugarcane in India, 1933 & 1934.
### Aliases: sayer.sugarcane.uniformity
### Keywords: datasets

### ** Examples

## Not run: 
##D   
##D   data(sayer.sugarcane.uniformity)
##D   dat33 <- subset(sayer.sugarcane.uniformity, year==1933)
##D   dat34 <- subset(sayer.sugarcane.uniformity, year==1934)
##D   
##D   b1 <- subset(dat33, row<31)
##D   b2 <- subset(dat33, row > 30 & row < 61)
##D   b3 <- subset(dat33, row > 60 & row < 91)
##D   b4 <- subset(dat33, row > 105 & row < 136)
##D   mean(b1$yield) # 340.7 vs Sayer 340.8
##D   mean(b2$yield) # 338.2 vs Sayer 338.6
##D   mean(b3$yield) # 331.3 vs Sayer 330.2
##D   mean(b4$yield) # 295.4 vs Sayer 295.0
##D 
##D   mean(dat34$yield) # 270.83 vs Sayer 270.83
##D   
##D   require(desplot)
##D   
##D   desplot(yield ~ col*row, dat33,
##D           flip=TRUE, aspect=408/480, # true aspect
##D           main="sayer.sugarcane.uniformity 1933")
##D 
##D   desplot(yield ~ col*row, dat34,
##D           flip=TRUE, aspect=363/480, # true aspect
##D           main="sayer.sugarcane.uniformity 1934")
##D   
## End(Not run)



