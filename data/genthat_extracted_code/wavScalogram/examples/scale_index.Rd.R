library(wavScalogram)


### Name: scale_index
### Title: Scale index of a signal
### Aliases: scale_index

### ** Examples

dt <- 0.1
time <- seq(0, 50, dt)
signal <- c(sin(pi * time), sin(pi * time / 2))
si <- scale_index(signal = signal, dt = dt)




