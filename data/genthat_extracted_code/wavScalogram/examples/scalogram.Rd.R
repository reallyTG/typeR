library(wavScalogram)


### Name: scalogram
### Title: Scalogram of a signal
### Aliases: scalogram

### ** Examples

dt <- 0.1
time <- seq(0, 50, dt)
signal <- c(sin(pi * time), sin(pi * time / 2))
scalog <- scalogram(signal = signal, dt = dt, border_effects = "INNER")




