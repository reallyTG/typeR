library(agridat)


### Name: lessman.sorghum.uniformity
### Title: Uniformity trial of sorghum
### Aliases: lessman.sorghum.uniformity
### Keywords: datasets

### ** Examples

## Not run: 
##D   
##D   data(lessman.sorghum.uniformity)
##D   dat <- lessman.sorghum.uniformity
##D   
##D   require(desplot)
##D   desplot(yield ~ col*row, dat,
##D           aspect=300/160, tick=TRUE, flip=TRUE, # true aspect
##D           main="lessman.sorghum.uniformity")
##D 
##D   # Omit outer two columns (called 'rows' by Lessman)
##D   dat <- subset(dat, col > 2 & col < 47)
##D   nrow(dat)
##D   var(dat$yield) # 9.09
##D   sd(dat$yield)/mean(dat$yield) # CV 9.2##D 
##D 
##D   require(reshape2)
##D   require(agricolae)
##D   dmat <- acast(dat, row~col, value.var='yield')
##D   index.smith(dmat,
##D               main="lessman.sorghum.uniformity",
##D               col="red") # Similar to Lessman Table 1
##D   # Lessman said that varying the width of plots did not have an appreciable
##D   # effect on CV, and optimal row length was 3.2 basic plots, about 15-20
##D   
## End(Not run)



