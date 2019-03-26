library(agridat)


### Name: love.cotton.uniformity
### Title: Uniformity trial of cotton
### Aliases: love.cotton.uniformity
### Keywords: datasets

### ** Examples

## Not run: 
##D 
##D   data(love.cotton.uniformity)
##D   # omit first column which has 20-foot plots
##D   dat <- subset(love.cotton.uniformity, col > 1)
##D 
##D   require(desplot)
##D   desplot(yield ~ col*row, dat, flip=TRUE,
##D           aspect=20/80, # just a guess
##D           main="love.cotton.uniformity")
##D   
## End(Not run)



