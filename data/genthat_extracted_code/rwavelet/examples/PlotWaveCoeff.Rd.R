library(rwavelet)


### Name: PlotWaveCoeff
### Title: Spike-plot display of wavelet coefficients.
### Aliases: PlotWaveCoeff

### ** Examples

x <- MakeSignal('Ramp', 128)
qmf <- MakeONFilter('Daubechies', 10)
L <- 3
scal <- 1
wc <- FWT_PO(x, L, qmf)
PlotWaveCoeff(wc,L,scal)



