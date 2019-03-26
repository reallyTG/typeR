library(seacarb)


### Name: Pcorrect
### Title: Pressure correction of equilibrium constants
### Aliases: Pcorrect
### Keywords: utilities

### ** Examples

k10 <- K1(T=25, P=0, S=35)
Pcorrect(Kvalue=k10, Ktype="K1", P=300, T=25, S=35, pHscale="T")



