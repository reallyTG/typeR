library(rwt)


### Name: mirdwt
### Title: Inverse Redundant Discrete Wavelet Transform
### Aliases: mirdwt
### Keywords: interface

### ** Examples

sig <- makesig(SIGNAL.LEOPOLD, 8)
h <- daubcqf(4)
L <- 1
ret.mrdwt <- mrdwt(sig$x, h$h.0, L)
ret.mirdwt <- mirdwt(ret.mrdwt$yl, ret.mrdwt$yh, h$h.0, ret.mrdwt$L)



