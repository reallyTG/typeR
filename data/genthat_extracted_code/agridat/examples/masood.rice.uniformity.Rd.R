library(agridat)


### Name: masood.rice.uniformity
### Title: Uniformity trial of rice
### Aliases: masood.rice.uniformity
### Keywords: datasets

### ** Examples

## Not run: 
##D 
##D   data(masood.rice.uniformity)
##D   dat <- masood.rice.uniformity
##D   
##D   require(desplot)
##D   desplot(yield ~ col*row, data=dat,
##D           flip=TRUE, tick=TRUE, aspect=24/12, # true aspect
##D           main="masood.rice.uniformity - yield heatmap")
##D 
##D   require(agricolae)
##D   require(reshape2)
##D   dmat <- acast(dat, row~col, value.var='yield')
##D   index.smith(dmat,
##D               main="masood.rice.uniformity",
##D               col="red") # CVs match Table 3
##D   
## End(Not run)



