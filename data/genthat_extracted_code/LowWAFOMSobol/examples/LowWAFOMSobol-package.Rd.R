library(LowWAFOMSobol)


### Name: LowWAFOMSobol-package
### Title: Low WAFOM Sobol Sequence
### Aliases: LowWAFOMSobol-package LowWAFOMSobol

### ** Examples

srange <- lowWAFOMSobol.dimMinMax()
mrange <- lowWAFOMSobol.dimF2MinMax(srange[1])
points <- lowWAFOMSobol.points(dimR=srange[1], dimF2=mrange[1])
points <- lowWAFOMSobol.points(dimR=srange[1], dimF2=mrange[1], digitalShift=TRUE)



