library(RSEIS)


### Name: doGABOR.AR
### Title: Gabor Transform with AR spectrum method
### Aliases: doGABOR.AR
### Keywords: misc

### ** Examples


data(KH)
###   swig(KH)

Xamp <- KH$JSTR[[1]]
Xamp <- Xamp[57914:72989]


EV <- doGABOR.AR(Xamp, DT = KH$dt[1] , multi = 1, scale.def = 0,
TWIN = 2, TSKIP = 0.2, PCTTAP = 0.05)





