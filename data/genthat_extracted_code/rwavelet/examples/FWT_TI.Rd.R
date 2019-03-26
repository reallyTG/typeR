library(rwavelet)


### Name: FWT_TI
### Title: Translation Invariant Forward Wavelet Transform.
### Aliases: FWT_TI

### ** Examples

x <- MakeSignal('Ramp', 8)
L <- 0
qmf <- MakeONFilter('Haar')
TIWT <- FWT_TI(x, L, qmf)



