library(psyphy)


### Name: dprime.ABX
### Title: d' for ABX Paradigm
### Aliases: dprime.ABX
### Keywords: univar

### ** Examples

dprime.ABX(H = 0.75, F = 0.3)
dprime.ABX(H = 0.75, F = 0.3, method = "IO")
dprime.ABX(zdiff = qnorm(0.75) - qnorm(0.3))
dprime.ABX(Pc.unb = pnorm( (qnorm(0.75) - qnorm(0.3))/2 ))




