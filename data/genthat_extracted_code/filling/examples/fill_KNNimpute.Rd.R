library(filling)


### Name: fill.KNNimpute
### Title: Imputation using Weighted K-nearest Neighbors
### Aliases: fill.KNNimpute

### ** Examples

## load image data of 'lena128'
data(lena128)

## transform 5% of entries into missing
set.seed(5)
A <- aux.rndmissing(lena128, x=0.05)

## apply the method with 3 different neighborhood size
fill1 <- fill.KNNimpute(A, k=5)
fill2 <- fill.KNNimpute(A, k=25)
fill3 <- fill.KNNimpute(A, k=50)

## visualize only the last ones from each run
par(mfrow=c(2,2), pty="s")
image(A, col=gray((0:100)/100), axes=FALSE, main="5% missing")
image(fill1$X, col=gray((0:100)/100), axes=FALSE, main="5-neighbor")
image(fill2$X, col=gray((0:100)/100), axes=FALSE, main="25-neighbor")
image(fill3$X, col=gray((0:100)/100), axes=FALSE, main="50-neighbor")




