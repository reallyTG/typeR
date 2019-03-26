library(spind)


### Name: mmiWMRR
### Title: Multi-model inference for wavelet multiresolution regression
### Aliases: mmiWMRR

### ** Examples


data(carlinadata)
coords <- carlinadata[ ,4:5]

## Not run: 
##D 
##D 
##D wrm <- WRM(carlina.horrida ~ aridity + land.use,
##D            family = "poisson",
##D            data = carlinadata,
##D            coord = coords,
##D            level = 1,
##D            wavelet = "d4")
##D 
##D mmi <- mmiWMRR(wrm,
##D                data = carlinadata,
##D                scale = 3,
##D                detail = TRUE,
##D                trace = FALSE)
##D 
## End(Not run)



