library(spdep)


### Name: LR.sarlm
### Title: Likelihood ratio test
### Aliases: LR.sarlm LR1.sarlm Wald1.sarlm Hausman.test Hausman.test.sarlm
###   Hausman.test.gmsar logLik.sarlm
### Keywords: spatial

### ** Examples

if (require(rgdal, quietly=TRUE)) {
example(columbus, package="spData")
mixed <- lagsarlm(CRIME ~ HOVAL + INC, data=columbus, nb2listw(col.gal.nb),
  type="mixed")
error <- errorsarlm(CRIME ~ HOVAL + INC, data=columbus, nb2listw(col.gal.nb))
LR.sarlm(mixed, error)
Hausman.test(error)
}



