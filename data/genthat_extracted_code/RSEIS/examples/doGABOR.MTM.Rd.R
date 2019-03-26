library(RSEIS)


### Name: doGABOR.MTM
### Title: Evolutive MTM Spectrum
### Aliases: doGABOR.MTM
### Keywords: misc

### ** Examples




data(KH)
###   swig(KH)

Xamp = KH$JSTR[[1]]
Xamp = Xamp[57914:64914]

EV = doGABOR.MTM(Xamp, DT = KH$dt[1], multi = 1, scale.def = 0,
TWIN = 1, TSKIP = .1, PCTTAP = 0.05)




