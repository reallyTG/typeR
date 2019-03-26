library(wavScalogram)


### Name: windowed_scalogram
### Title: Windowed scalograms of a signal
### Aliases: windowed_scalogram

### ** Examples

dt <- 0.1
time <- seq(0, 50, dt)
signal <- c(sin(pi * time), sin(pi * time / 2))
wscalog <- windowed_scalogram(signal = signal, dt = dt)





