library(comf)


### Name: calcPMVPPD
### Title: Calculating PMV and PPD
### Aliases: calcPMVPPD calcPMV PMV calcPPD PPD pmv ppd Fanger
### Keywords: manip

### ** Examples

## Calculating PMV and PPD
calcPMVPPD(25, 20, .2, 50)

## Using several rows of data:
ta <- c(20,22,24)
tr <- ta
vel <- rep(.15,3)
rh <- rep(50,3)

maxLength <- max(sapply(list(ta, tr, vel, rh), length))
PMV <- sapply(seq(maxLength), function(x) { calcPMV(ta[x], tr[x], vel[x], rh[x]) } ) 



