library(drc)


### Name: CRS.4a
### Title: The Cedergreen-Ritz-Streibig model
### Aliases: CRS.4a CRS.4b CRS.4c ml3a ml3b ml3c UCRS.4a UCRS.4b UCRS.4c
###   uml3a uml3b uml3c
### Keywords: models nonlinear

### ** Examples


## Fitting modified logistic models
lettuce.crsm1 <- drm(lettuce[,c(2,1)], fct=CRS.4a())
summary(lettuce.crsm1)
ED(lettuce.crsm1, c(50))

## Need to explicitly specify that the upper limit
## is the reference in order to get ED10 and ED90 right
ED(lettuce.crsm1, c(10, 50, 90), reference = "upper")

lettuce.crsm2 <- drm(lettuce[,c(2,1)], fct=CRS.4b())
summary(lettuce.crsm2)
ED(lettuce.crsm2, c(50))

lettuce.crsm3 <- drm(lettuce[,c(2,1)], fct=CRS.4c())
summary(lettuce.crsm3)
ED(lettuce.crsm3, c(50))




