library(rwt)


### Name: midwt
### Title: Inverse Discrete Wavelet Transform
### Aliases: midwt
### Keywords: interface

### ** Examples

sig <- makesig(SIGNAL.LIN.CHIRP, 8)
h <- daubcqf(4)
L <- 1
ret.mdwt <- mdwt(sig$x, h$h.0, L)
ret.midwt <- midwt(ret.mdwt$y, h$h.0, ret.mdwt$L)



