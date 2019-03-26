library(agridat)


### Name: kadam.millet.uniformity
### Title: Uniformity trial of millet
### Aliases: kadam.millet.uniformity
### Keywords: datasets

### ** Examples

## Not run: 
##D   
##D   data(kadam.millet.uniformity)
##D   dat <- kadam.millet.uniformity
##D   
##D   # similar to Kadam fig 1
##D   require(desplot)
##D   desplot(yield ~ col*row, dat,
##D           subset=year==1933,
##D           flip=TRUE, aspect=(10*33)/(8*16.5), # true aspect
##D           main="kadam.millet.uniformity 1933")
##D 
##D   desplot(yield ~ col*row, dat,
##D           subset=year==1934,
##D           flip=TRUE, aspect=(20*16.5)/(8*16.5), # true aspect
##D           main="kadam.millet.uniformity 1934")
##D   
## End(Not run)



