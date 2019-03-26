library(wavScalogram)


### Name: cwt_wst
### Title: Continuous wavelet transform
### Aliases: cwt_wst

### ** Examples

dt <- 0.1
time <- seq(0, 50, dt)
signal <- c(sin(pi * time), sin(pi * time / 2))
cwt <- cwt_wst(signal = signal, dt = dt, energy_density = TRUE)




