library(agridat)


### Name: draper.safflower.uniformity
### Title: Uniformity trial of safflower
### Aliases: draper.safflower.uniformity
### Keywords: datasets

### ** Examples

## Not run: 
##D   
##D   data("draper.safflower.uniformity")
##D   dat4 <- subset(draper.safflower.uniformity, expt=="E4")
##D   dat5 <- subset(draper.safflower.uniformity, expt=="E5")
##D 
##D   require(desplot)
##D   desplot(yield~col*row, dat4,
##D           flip=TRUE, tick=TRUE, aspect=72/53, # true aspect
##D           main="draper.safflower.uniformity (four foot)")
##D 
##D   desplot(yield~col*row, dat5,
##D           flip=TRUE, tick=TRUE, aspect=90/46, # true aspect
##D           main="draper.safflower.uniformity (five foot)")
##D 
##D   require(agricolae)
##D   require(reshape2)
##D   # Remove border plots at either end and right side
##D   dat4 <- subset(dat4, row>1 & row<20)
##D   dat4 <- subset(dat4, col<17)
##D   dat5 <- subset(dat5, row>1 & row<20)
##D   dat5 <- subset(dat5, col<15)
##D   
##D   s4 <- index.smith(acast(dat4, row~col, value.var='yield'),
##D                     main="draper.safflower.uniformity (four foot)",
##D                     col="red")$uni
##D   s4 # match Draper table 2, p 22
##D   
##D   ## s5 <- index.smith(acast(dat5, row~col, value.var='yield'),
##D   ##                   main="draper.safflower.uniformity (five foot)",
##D   ##                   col="red")$uni
##D   ## s5 # match Draper table 1, p 21
##D   
## End(Not run)



