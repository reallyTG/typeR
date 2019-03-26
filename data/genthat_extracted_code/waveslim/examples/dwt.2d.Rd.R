library(waveslim)


### Name: dwt.2d
### Title: Two-Dimensional Discrete Wavelet Transform
### Aliases: dwt.2d idwt.2d
### Keywords: ts

### ** Examples

## Xbox image
data(xbox)
xbox.dwt <- dwt.2d(xbox, "haar", 3)
par(mfrow=c(1,1), pty="s")
plot.dwt.2d(xbox.dwt)
par(mfrow=c(2,2), pty="s")
image(1:dim(xbox)[1], 1:dim(xbox)[2], xbox, xlab="", ylab="",
      main="Original Image")
image(1:dim(xbox)[1], 1:dim(xbox)[2], idwt.2d(xbox.dwt), xlab="", ylab="",
      main="Wavelet Reconstruction")
image(1:dim(xbox)[1], 1:dim(xbox)[2], xbox - idwt.2d(xbox.dwt),
      xlab="", ylab="", main="Difference")

## Daubechies image
data(dau)
par(mfrow=c(1,1), pty="s")
image(dau, col=rainbow(128))
sum(dau^2)
dau.dwt <- dwt.2d(dau, "d4", 3)
plot.dwt.2d(dau.dwt)
sum(plot.dwt.2d(dau.dwt, plot=FALSE)^2)



