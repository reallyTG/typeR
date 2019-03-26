library(wavelets)


### Name: dwt.forward
### Title: Discrete Wavelet Transform and Maximal Overlap Discrete Wavelet
###   Tranform Forward and Backward Pyramid Algorithm
### Aliases: dwt.forward dwt.backward modwt.forward modwt.backward
### Keywords: ts

### ** Examples

# obtain the two series listed in Percival and Walden (2000), page 42
X1 <- c(.2,-.4,-.6,-.5,-.8,-.4,-.9,0,-.2,.1,-.1,.1,.7,.9,0,.3)
X2 <- c(.2,-.4,-.6,-.5,-.8,-.4,-.9,0,-.2,.1,-.1,.1,-.7,.9,0,.3)

# compute the LA8 wavelet filter for both DWT and MODWT
la8.dwt <- wt.filter()
la8.modwt <- wt.filter(modwt=TRUE)

# compute the DWT and MODWT level one wavelet and scaling coefficients
wt.dwt <- dwt.forward(X1, la8.dwt)
wt.modwt <- modwt.forward(X2, la8.modwt, 1)

# compute the original series with the level one coefficients
newX.dwt <- dwt.backward(wt.dwt$W, wt.dwt$V, la8.dwt)
newX.modwt <- modwt.backward(wt.modwt$W, wt.modwt$V, la8.modwt, 1)



