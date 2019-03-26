library(geiger)


### Name: ratematrix
### Title: evolutionary VCV matrix
### Aliases: ratematrix
### Keywords: arith

### ** Examples


geo <- get(data(geospiza))

## EVOLUTIONARY VCV
ratematrix(geo$phy, geo$dat)

## EVOLUTIONARY VCV -- assuming speciational model
kphy <- rescale(geo$phy, "kappa", 0)
ratematrix(kphy, geo$dat)
geo <- get(data(geospiza))

## EVOLUTIONARY VCV
ratematrix(geo$phy, geo$dat)

## EVOLUTIONARY VCV -- assuming speciational model
kphy <- rescale(geo$phy, "kappa", 0)
ratematrix(kphy, geo$dat)




