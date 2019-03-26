library(EMD)


### Name: emd2d
### Title: Bidimenasional Empirical Mode Decomposition
### Aliases: emd2d
### Keywords: nonparametric

### ** Examples

data(lena)
z <- lena[seq(1, 512, by=4), seq(1, 512, by=4)]
image(z, main="Lena", xlab="", ylab="", col=gray(0:100/100), axes=FALSE)

## Not run: 
##D lenadecom <- emd2d(z, max.imf = 4)
##D imageEMD(z=z, emdz=lenadecom, extrema=TRUE, col=gray(0:100/100))
## End(Not run)

### Test Image
ndata <- 128

x <- y <- seq(0, 9, length=ndata)
meanf1 <- outer(sin(2 * pi * x), sin(2 * pi * y))
meanf2 <- outer(sin(0.5 * pi * x), sin(0.5 * pi * y))
meanf <- meanf1 + meanf2

snr <- 2
set.seed(77)
zn <- meanf + matrix(rnorm(ndata^2, 0, sd(c(meanf))/snr), ncol=ndata)

rangezn <- range(c(meanf1, meanf2, meanf, zn))
par(mfrow=c(2,2), mar=0.1 + c(0, 0.25, 3, 0.25))
image(meanf1, main="high frequency component", xlab="", ylab="", zlim=rangezn, 
    col=gray(100:0/100), axes=FALSE)
image(meanf2, main="low frequency component", xlab="", ylab="", zlim=rangezn, 
    col=gray(100:0/100), axes=FALSE)
image(meanf, main="test image", xlab="", ylab="", zlim=rangezn, col=gray(100:0/100), axes=FALSE)
image(zn, main="noisy image", xlab="", ylab="", zlim=rangezn, col=gray(100:0/100), axes=FALSE)

## Not run: 
##D out <- emd2d(zn, max.imf=3, sm="locfit", smlevels=1, spar=0.004125)
##D par(mfcol=c(3,1), mar=0.1 + c(0, 0.25, 0.25, 0.25)) 
##D image(out$imf[[1]], main="", xlab="", ylab="", col=gray(100:0/100), zlim=rangezn, axes=FALSE)
##D image(out$imf[[2]], main="", xlab="", ylab="", col=gray(100:0/100), zlim=rangezn, axes=FALSE)
##D image(out$imf[[3]], main="", xlab="", ylab="", col=gray(100:0/100), zlim=rangezn, axes=FALSE)
## End(Not run)



