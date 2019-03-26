library(rwt)


### Name: mrdwt
### Title: Redundant Discrete Wavelet Transform
### Aliases: mrdwt
### Keywords: interface

### ** Examples

sig <- makesig(SIGNAL.LEOPOLD, 8)
h <- daubcqf(4)
L <- 1
ret.mrdwt <- mrdwt(sig$x, h$h.0, L)



