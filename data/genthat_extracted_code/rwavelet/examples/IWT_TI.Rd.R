library(rwavelet)


### Name: IWT_TI
### Title: Translation Invariant Iorward Wavelet Transform.
### Aliases: IWT_TI

### ** Examples

x <- MakeSignal('Ramp', 8)
L <- 0
qmf <- MakeONFilter('Haar')
TIWT <- FWT_TI(x, L, qmf)
xr <- IWT_TI(TIWT,qmf)



