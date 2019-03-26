library(integIRTy)


### Name: dichotomizeCN
### Title: Dichotomizing copy number data based on segmented data (i.e.
###   log2ratio).
### Aliases: dichotomizeCN

### ** Examples

data(OV)
binDat <- dichotomizeCN(CN_T[1:20, ], CN_N[1:20, ])
binDat[15:20, 1:2]



