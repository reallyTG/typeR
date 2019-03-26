library(agridat)


### Name: odland.soybean.uniformity
### Title: Uniformity trials of soy hay and soybeans
### Aliases: odland.soybean.uniformity odland.soyhay.uniformity
### Keywords: datasets

### ** Examples

## Not run: 
##D   
##D   require(desplot)
##D 
##D   data(odland.soyhay.uniformity)
##D   dat1 <- odland.soyhay.uniformity
##D   desplot(yield ~ col*row, dat1,
##D           flip=TRUE, aspect=200/105, # true aspect
##D           main="odland.soyhay.uniformity")
##D 
##D   data(odland.soybean.uniformity)
##D   dat2 <- odland.soybean.uniformity
##D   desplot(yield ~ col*row, dat2, flip=TRUE,
##D           aspect = 232/137, 
##D           main="odland.soybean.uniformity")
##D   
## End(Not run)



