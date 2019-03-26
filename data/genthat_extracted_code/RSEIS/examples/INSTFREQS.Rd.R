library(RSEIS)


### Name: INSTFREQS
### Title: Instrument Frequencies
### Aliases: INSTFREQS
### Keywords: misc

### ** Examples


K  <-  PreSet.Instr()
b  <-  K[[1]]$zeros
a  <-  K[[1]]$poles
INSTFREQS(b, a, 2*pi*12)






