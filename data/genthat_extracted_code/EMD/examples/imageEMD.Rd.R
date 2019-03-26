library(EMD)


### Name: imageEMD
### Title: Plot of Bidimenasional Empirical Mode Decomposition Result
### Aliases: imageEMD
### Keywords: nonparametric

### ** Examples

data(lena)
z <- lena[seq(1, 512, by=4), seq(1, 512, by=4)]
image(z, main="Lena", xlab="", ylab="", col=gray(0:100/100), axes=FALSE)

## Not run: 
##D lenadecom <- emd2d(z, max.imf = 4)
##D imageEMD(z=z, emdz=lenadecom, extrema=TRUE, col=gray(0:100/100))
## End(Not run)



