library(drc)


### Name: cedergreen
### Title: The Cedergreen-Ritz-Streibig model
### Aliases: cedergreen CRS.6 ucedergreen
### Keywords: models nonlinear

### ** Examples


## Estimating CRS model with alpha unknown
lettuce.crsm1 <- drm(weight~conc, data = lettuce, fct = CRS.6())
summary(lettuce.crsm1)
plot(lettuce.crsm1)  # oops: not increasing until hormesis peak




