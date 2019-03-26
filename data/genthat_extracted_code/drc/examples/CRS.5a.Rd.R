library(drc)


### Name: CRS.5a
### Title: Cedergreen-Ritz-Streibig dose-reponse model for describing
###   hormesis
### Aliases: CRS.5a CRS.5b CRS.5c ml4a ml4b ml4c UCRS.5a UCRS.5b UCRS.5c
###   uml4a uml4b uml4c
### Keywords: models nonlinear

### ** Examples


## Modified logistic model
lettuce.m1 <- drm(lettuce[,c(2,1)], fct=CRS.5a())
summary(lettuce.m1)
ED(lettuce.m1, c(50))

lettuce.m2 <- drm(lettuce[,c(2,1)], fct=CRS.5b())
summary(lettuce.m2)
ED(lettuce.m2, c(50))

lettuce.m3 <- drm(lettuce[,c(2,1)], fct=CRS.5c())
summary(lettuce.m3)
ED(lettuce.m3, c(50))




