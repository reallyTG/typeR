library(filling)


### Name: fill.USVT
### Title: Matrix Completion by Universal Singular Value Thresholding
### Aliases: fill.USVT

### ** Examples

## Not run: 
##D ## load image data of 'lena128'
##D data(lena128)
##D 
##D ## transform 5% of entries into missing
##D set.seed(5)
##D A <- aux.rndmissing(lena128, x=0.10)
##D 
##D ## apply the method with 3 different control 'eta'
##D fill1 <- fill.USVT(A, eta=0.01)
##D fill2 <- fill.USVT(A, eta=0.5)
##D fill3 <- fill.USVT(A, eta=0.99)
##D 
##D ## visualize only the last ones from each run
##D par(mfrow=c(2,2), pty="s")
##D image(A, col=gray((0:100)/100), axes=FALSE, main="5% missing")
##D image(fill1$Ahat, col=gray((0:100)/100), axes=FALSE, main="eta=0.01")
##D image(fill2$Ahat, col=gray((0:100)/100), axes=FALSE, main="eta=0.5")
##D image(fill3$Ahat, col=gray((0:100)/100), axes=FALSE, main="eta=0.99")
## End(Not run)




