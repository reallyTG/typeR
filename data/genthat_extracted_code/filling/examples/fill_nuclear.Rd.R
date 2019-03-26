library(filling)


### Name: fill.nuclear
### Title: Low-Rank Completion with Nuclear Norm Optimization
### Aliases: fill.nuclear

### ** Examples

## Not run: 
##D ## load image data of 'lena64'
##D data(lena64)
##D 
##D ## transform 5% of entries into missing
##D A <- aux.rndmissing(lena64, x=0.05)
##D 
##D ## apply the method
##D filled <- fill.nuclear(A)
##D 
##D ## visualize
##D par(mfrow=c(1,2), pty="s")
##D image(A, col=gray((0:100)/100), axes=FALSE, main="5% missing")
##D image(filled$X, col=gray((0:100)/100), axes=FALSE, main="processed")
## End(Not run)




