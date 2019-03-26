library(solaR)


### Name: C_HQCurve
### Title: H-Q curves of a centrifugal pump
### Aliases: HQCurve
### Keywords: utilities

### ** Examples

library(lattice)
library(latticeExtra)

data(pumpCoef)

CoefSP8A44<-subset(pumpCoef, Qn==8&stages==44)
CurvaSP8A44<-HQCurve(pump=CoefSP8A44)



