library(wavScalogram)


### Name: windowed_scale_index
### Title: Windowed scale index
### Aliases: windowed_scale_index

### ** Examples

dt <- 0.1
time <- seq(0, 50, dt)
signal <- c(sin(pi * time), sin(pi * time / 2))
# First, we try with default s1 scales (a vector with a wide range of values for s1).
wsi_full <- windowed_scale_index(signal = signal, dt = dt, figureperiod = FALSE)
# Next, we choose a meaningful s1 value, greater than all relevant scales.
wsi <- windowed_scale_index(signal = signal, dt = dt, s1 = 4, figureperiod = FALSE)




