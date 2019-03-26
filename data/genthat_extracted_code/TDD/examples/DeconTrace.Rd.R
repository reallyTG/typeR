library(TDD)


### Name: DeconTrace
### Title: Deconvolve Instrument Response (Single Trace)
### Aliases: DeconTrace
### Keywords: misc

### ** Examples

# Response of Guralp CMG-3T
DPZ = GetDPZ(4, 0.01)[[1]]

data(COLOC)
x = COLOC$JSTR[[1]]

DeconTrace(x, DPZ)



