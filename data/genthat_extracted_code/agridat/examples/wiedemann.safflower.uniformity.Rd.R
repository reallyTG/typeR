library(agridat)


### Name: wiedemann.safflower.uniformity
### Title: Uniformity trial of safflower
### Aliases: wiedemann.safflower.uniformity
### Keywords: datasets

### ** Examples

## Not run: 
##D 
##D   data(wiedemann.safflower.uniformity)
##D   dat <- wiedemann.safflower.uniformity
##D 
##D   # CV of entire field = 39##D 
##D   sd(dat$yield)/mean(dat$yield)
##D 
##D   require(desplot)
##D   desplot(yield~col*row, dat,
##D           flip=TRUE, tick=TRUE, aspect =99/165, # true aspect
##D           main="wiedemann.safflower.uniformity (true shape)")
##D 
##D   require(agricolae)
##D   require(reshape2)
##D   dmat <- acast(dat, row~col, value.var='yield')
##D   index.smith(dmat,
##D               main="wiedemann.safflower.uniformity",
##D               col="red")
##D   
## End(Not run)



