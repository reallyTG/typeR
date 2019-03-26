library(TDD)


### Name: ConvolveTrace
### Title: Convolve Trace with Instrument Response
### Aliases: ConvolveTrace
### Keywords: misc

### ** Examples

# Response of Guralp CMG-40T
DPZ = GetDPZ(12, 1)[[1]]

x = rnorm(1000)
ConvolveTrace(x, DPZ)




