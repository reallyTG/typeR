library(spind)


### Name: rvi.plot
### Title: Relative Variable Importance
### Aliases: rvi.plot

### ** Examples

data(carlinadata)
coords<- carlinadata[,4:5]

## Not run: 
##D 
##D wrm <- WRM(carlina.horrida ~ aridity + land.use,
##D            family = "poisson",
##D            data = carlinadata,
##D            coord = coords,
##D            level = 1,
##D            wavelet = "d4")
##D 
##D mmi <- mmiWMRR(wrm, data = carlinadata, scale = 3, detail = TRUE)
##D 
##D 
##D # Plot scale-dependent relative variable importance
##D rvi <- rvi.plot(carlina.horrida ~ aridity + land.use,
##D                 family = "poisson",
##D                 data = carlinadata,
##D                 coord = coords,
##D                 maxlevel = 4,
##D                 detail = TRUE,
##D                 wavelet = "d4")
##D 
##D rvi$plot
##D rvi$rvi
##D 
## End(Not run)



