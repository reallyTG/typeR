library(waveslim)


### Name: denoise.2d
### Title: Denoise an Image via the 2D Discrete Wavelet Transform
### Aliases: denoise.dwt.2d denoise.modwt.2d
### Keywords: ts

### ** Examples

## Xbox image
data(xbox)
n <- NROW(xbox)
xbox.noise <- xbox + matrix(rnorm(n*n, sd=.15), n, n)
par(mfrow=c(2,2), cex=.8, pty="s")
image(xbox.noise, col=rainbow(128), main="Original Image")
image(denoise.dwt.2d(xbox.noise, wf="haar"), col=rainbow(128),
      zlim=range(xbox.noise), main="Denoised image")
image(xbox.noise - denoise.dwt.2d(xbox.noise, wf="haar"), col=rainbow(128),
      zlim=range(xbox.noise), main="Residual image")

## Daubechies image
data(dau)
n <- NROW(dau)
dau.noise <- dau + matrix(rnorm(n*n, sd=10), n, n)
par(mfrow=c(2,2), cex=.8, pty="s")
image(dau.noise, col=rainbow(128), main="Original Image")
dau.denoise <- denoise.modwt.2d(dau.noise, wf="d4", rule="soft")
image(dau.denoise, col=rainbow(128), zlim=range(dau.noise),
      main="Denoised image")
image(dau.noise - dau.denoise, col=rainbow(128), main="Residual image")



