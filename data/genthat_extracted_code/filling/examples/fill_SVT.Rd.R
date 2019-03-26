library(filling)


### Name: fill.SVT
### Title: Singular Value Thresholding for Nuclear Norm Optimization
### Aliases: fill.SVT

### ** Examples

## load image data of 'lena128'
data(lena128)

## transform 5% of entries into missing
A <- aux.rndmissing(lena128, x=0.05)

## apply the method
fill1 <- fill.SVT(A, lambda=0.1)
fill2 <- fill.SVT(A, lambda=1.0)
fill3 <- fill.SVT(A, lambda=10)

## visualize
par(mfrow=c(2,2), pty="s")
image(A, col=gray((0:100)/100), axes=FALSE, main="5% missing")
image(fill1$X, col=gray((0:100)/100), axes=FALSE, main="lbd=0.1")
image(fill2$X, col=gray((0:100)/100), axes=FALSE, main="lbd=1")
image(fill3$X, col=gray((0:100)/100), axes=FALSE, main="lbd=10")




