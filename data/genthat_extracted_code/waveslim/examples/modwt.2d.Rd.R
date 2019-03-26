library(waveslim)


### Name: modwt.2d
### Title: Two-Dimensional Maximal Overlap Discrete Wavelet Transform
### Aliases: modwt.2d imodwt.2d
### Keywords: ts

### ** Examples

## Xbox image
data(xbox)
xbox.modwt <- modwt.2d(xbox, "haar", 2)
## Level 1 decomposition
par(mfrow=c(2,2), pty="s")
image(xbox.modwt$LH1, col=rainbow(128), axes=FALSE, main="LH1")
image(xbox.modwt$HH1, col=rainbow(128), axes=FALSE, main="HH1")
frame()
image(xbox.modwt$HL1, col=rainbow(128), axes=FALSE, main="HL1")
## Level 2 decomposition
par(mfrow=c(2,2), pty="s")
image(xbox.modwt$LH2, col=rainbow(128), axes=FALSE, main="LH2")
image(xbox.modwt$HH2, col=rainbow(128), axes=FALSE, main="HH2")
image(xbox.modwt$LL2, col=rainbow(128), axes=FALSE, main="LL2")
image(xbox.modwt$HL2, col=rainbow(128), axes=FALSE, main="HL2")
sum((xbox - imodwt.2d(xbox.modwt))^2)

data(dau)
par(mfrow=c(1,1), pty="s")
image(dau, col=rainbow(128), axes=FALSE, main="Ingrid Daubechies")
sum(dau^2)
dau.modwt <- modwt.2d(dau, "d4", 2)
## Level 1 decomposition
par(mfrow=c(2,2), pty="s")
image(dau.modwt$LH1, col=rainbow(128), axes=FALSE, main="LH1")
image(dau.modwt$HH1, col=rainbow(128), axes=FALSE, main="HH1")
frame()
image(dau.modwt$HL1, col=rainbow(128), axes=FALSE, main="HL1")
## Level 2 decomposition
par(mfrow=c(2,2), pty="s")
image(dau.modwt$LH2, col=rainbow(128), axes=FALSE, main="LH2")
image(dau.modwt$HH2, col=rainbow(128), axes=FALSE, main="HH2")
image(dau.modwt$LL2, col=rainbow(128), axes=FALSE, main="LL2")
image(dau.modwt$HL2, col=rainbow(128), axes=FALSE, main="HL2")
sum((dau - imodwt.2d(dau.modwt))^2)



