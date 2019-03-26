library(sdcMicro)


### Name: indivRisk
### Title: Individual Risk computation
### Aliases: indivRisk
### Keywords: manip

### ** Examples


## example from Capobianchi, Polettini and Lucarelli:
data(francdat)
f <- freqCalc(francdat, keyVars=c(2,4,5,6),w=8)
f
f$fk
f$Fk
## individual risk calculation:
indivf <- indivRisk(f)
indivf$rk




