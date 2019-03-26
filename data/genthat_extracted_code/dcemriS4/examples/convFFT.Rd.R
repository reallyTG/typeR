library(dcemriS4)


### Name: convFFT
### Title: Convolution of 3D Arrays using the Fourier Transform
### Aliases: convFFT

### ** Examples

cube <- array(0, c(20,20,1))
cube[9:12,9:12,1] <- 1
tkernel <- array(0, c(20,20,1))
tkernel[,,1] <- c(.5, 1, .5, rep(0,20-3)) %o% c(.5, 1, .5, rep(0,20-3))
tcenter <- findCenter(ifelse(tkernel > 0, TRUE, FALSE))
out <- convFFT(tkernel, cube, tcenter)
out[8:13,8:13,1]  ## text output

par(mfrow=c(2,2))  ## graphic output
image(drop(tkernel), col=oro.nifti::tim.colors(), main="Template")
image(drop(cube), col=oro.nifti::tim.colors(), main="Target")
image(drop(out), col=oro.nifti::tim.colors(), main="Output")



