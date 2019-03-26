library(filling)


### Name: fill.HardImpute
### Title: HardImpute : Generalized Spectral Regularization
### Aliases: fill.HardImpute

### ** Examples

## load image data of 'lena128'
data(lena128)

## transform 5% of entries into missing
A <- aux.rndmissing(lena128, x=0.05)

## apply the method with 3 rank conditions
fill1 <- fill.HardImpute(A, lambdas=c(500,100,50), rk=10)
fill2 <- fill.HardImpute(A, lambdas=c(500,100,50), rk=50)
fill3 <- fill.HardImpute(A, lambdas=c(500,100,50), rk=100)

## visualize only the last ones from each run
par(mfrow=c(2,2), pty="s")
image(A, col=gray((0:100)/100), axes=FALSE, main="5% missing")
image(fill1$X[,,3], col=gray((0:100)/100), axes=FALSE, main="Rank 10")
image(fill2$X[,,3], col=gray((0:100)/100), axes=FALSE, main="Rank 50")
image(fill3$X[,,3], col=gray((0:100)/100), axes=FALSE, main="Rank 100")




