library(psyphy)


### Name: dprime.SD
### Title: d' for Same-different Paradigm
### Aliases: dprime.SD
### Keywords: univar

### ** Examples

dprime.SD(H = 0.642, F = 0.3)
dprime.SD(H = 0.75, F = 0.3, method = "IO")
dprime.SD(zdiff = qnorm(0.75) - qnorm(0.3), method = "IO")
dprime.SD(Pcmax = pnorm( (qnorm(0.75) - qnorm(0.3))/2 ), method = "IO")



