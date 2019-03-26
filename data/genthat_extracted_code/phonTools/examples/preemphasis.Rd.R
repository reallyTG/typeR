library(phonTools)


### Name: preemphasis
### Title: Add Preemphasis
### Aliases: preemphasis

### ** Examples

signal = sinusoid (c(100, 200, 400, 800, 1600), fs = 4000, 
dur = 100, sum = TRUE)[,7]

preemphasis (signal, verify = TRUE, fs = 4000, cutoff = 50)



