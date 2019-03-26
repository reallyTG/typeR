library(filling)


### Name: fill.SoftImpute
### Title: SoftImpute : Spectral Regularization
### Aliases: fill.SoftImpute

### ** Examples

## load image data of 'lena128'
data(lena128)

## transform 5% of entries into missing
A <- aux.rndmissing(lena128, x=0.05)

## apply the method with 3 lambda values
fill <- fill.SoftImpute(A, lambdas=c(500,100,50))

## visualize
par(mfrow=c(2,2), pty="s")
image(A, col=gray((0:100)/100), axes=FALSE, main="5% missing")
image(fill$X[,,1], col=gray((0:100)/100), axes=FALSE, main="lambda=500")
image(fill$X[,,2], col=gray((0:100)/100), axes=FALSE, main="lambda=100")
image(fill$X[,,3], col=gray((0:100)/100), axes=FALSE, main="lambda=50")




