library(spind)


### Name: scaleWMRR
### Title: Scaling by wavelet multiresolution regression (WMRR)
### Aliases: scaleWMRR

### ** Examples


data(carlinadata)
coords <- carlinadata[ ,4:5]

## Not run: 
##D 
##D # scaleWMRR at scale = 0 is equivalent to GLM
##D 
##D ms0 <- scaleWMRR(carlina.horrida ~ aridity + land.use,
##D                  family = "poisson",
##D                  data = carlinadata,
##D                  coord = coords,
##D                  scale = 0,
##D                  trace = TRUE)
##D 
##D # scale-specific regressions for detail components
##D ms1 <- scaleWMRR(carlina.horrida ~ aridity + land.use,
##D                  family = "poisson",
##D                  data = carlinadata,
##D                  coord = coords,
##D                  scale = 1,
##D                  trace = TRUE)
##D 
##D ms2 <- scaleWMRR(carlina.horrida ~ aridity + land.use,
##D                  family = "poisson",
##D                  data = carlinadata,
##D                  coord = coords,
##D                  scale = 2,
##D                  trace = TRUE)
##D 
##D ms3<- scaleWMRR(carlina.horrida ~ aridity + land.use,
##D                  family = "poisson",
##D                  data = carlinadata,
##D                  coord = coords,
##D                  scale = 3,
##D                  trace = TRUE)
##D 
## End(Not run)



