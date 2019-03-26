library(rwt)


### Name: mdwt
### Title: Discrete Wavelet Transform
### Aliases: mdwt
### Keywords: interface

### ** Examples

sig <- makesig(SIGNAL.LIN.CHIRP, 8)
h <- daubcqf(4)
L <- 2
ret.mdwt <- mdwt(sig$x, h$h.0, L)



