library(rwavelet)


### Name: FWT_PO
### Title: Forward Wavelet Transform (periodized, orthogonal).
### Aliases: FWT_PO

### ** Examples

x <- MakeSignal('Ramp', 8)
L <- 0
qmf <- MakeONFilter('Haar')
wc <- FWT_PO(x, L, qmf)



