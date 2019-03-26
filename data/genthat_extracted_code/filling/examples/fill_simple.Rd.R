library(filling)


### Name: fill.simple
### Title: Imputation by Simple Rules
### Aliases: fill.simple

### ** Examples

## load image data of 'lena128'
data(lena128)

## transform 5% of entries into missing
A <- aux.rndmissing(lena128, x=0.05)

## apply all three methods#'
fill1 <- fill.simple(A, method="mean")
fill2 <- fill.simple(A, method="median")
fill3 <- fill.simple(A, method="random")

## visualize
par(mfrow=c(2,2), pty="s")
image(A, col=gray((0:100)/100), axes=FALSE, main="original")
image(fill1$X, col=gray((0:100)/100), axes=FALSE, main="method:mean")
image(fill2$X, col=gray((0:100)/100), axes=FALSE, main="method:median")
image(fill3$X, col=gray((0:100)/100), axes=FALSE, main="method:random")




