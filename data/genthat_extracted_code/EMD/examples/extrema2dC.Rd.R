library(EMD)


### Name: extrema2dC
### Title: Finding Local Extrema
### Aliases: extrema2dC
### Keywords: nonparametric

### ** Examples

data(lena)
z <- lena[seq(1, 512, by=4), seq(1, 512, by=4)]

par(mfrow=c(1,3), mar=c(0, 0.5, 2, 0.5))
image(z, main="Lena", xlab="", ylab="", col=gray(0:100/100), axes=FALSE)    

example <- extrema2dC(z=z)
localmin <- matrix(256, 128, 128)
localmin[example$minindex] <- z[example$minindex]
image(localmin, main="Local minimum", xlab="", ylab="", col=gray(0:100/100), axes=FALSE)

localmax <- matrix(0, 128, 128)
localmax[example$maxindex] <- z[example$maxindex]
image(localmax, main="Local maximum", xlab="", ylab="", col=gray(0:100/100), axes=FALSE)



