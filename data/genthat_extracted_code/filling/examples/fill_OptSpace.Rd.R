library(filling)


### Name: fill.OptSpace
### Title: OptSpace
### Aliases: fill.OptSpace

### ** Examples

## load image data of 'lena64'
data(lena64)

## transform 5% of entries into missing
A <- aux.rndmissing(lena64, x=0.05)

## apply the method with different rank assumptions
filled5  <- fill.OptSpace(A, ropt=5)
filled10 <- fill.OptSpace(A, ropt=10)

## visualize
par(mfrow=c(1,3), pty="s")
image(A, col=gray((0:100)/100), axes=FALSE, main="5% missing")
image(filled5$X, col=gray((0:100)/100), axes=FALSE, main="rank 5")
image(filled10$X, col=gray((0:100)/100), axes=FALSE, main="rank 10")





