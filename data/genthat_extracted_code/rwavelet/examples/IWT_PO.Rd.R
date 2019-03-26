library(rwavelet)


### Name: IWT_PO
### Title: Inverse Wavelet Transform (periodized, orthogonal).
### Aliases: IWT_PO

### ** Examples

x <- MakeSignal('Ramp', 8)
L <- 0
qmf <- MakeONFilter('Haar')
wc <- FWT_PO(x, L, qmf)
xr <- IWT_PO(wc,L,qmf)



