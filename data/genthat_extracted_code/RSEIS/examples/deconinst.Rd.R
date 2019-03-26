library(RSEIS)


### Name: deconinst
### Title: Deconvolve instrument response from seismic data
### Aliases: deconinst
### Keywords: misc

### ** Examples



Kal <- PreSet.Instr()
amp <- rnorm(1024)
Calibnew <- c(1,1.0, 0.0 )

dy  <- deconinst(amp, 0.008, Kal,1, Calibnew, waterlevel=1.e-8)






