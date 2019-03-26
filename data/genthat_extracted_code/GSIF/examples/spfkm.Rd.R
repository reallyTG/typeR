library(GSIF)


### Name: spfkm
### Title: Supervised fuzzy _k_-means on spatial pixels
### Aliases: spfkm
###   spfkm,formula,SpatialPointsDataFrame,SpatialPixelsDataFrame-method
### Keywords: methods

### ** Examples

# load data:
library(plotKML)
library(sp)

data(eberg)
# subset to 20%:
eberg <- eberg[runif(nrow(eberg))<.2,]
data(eberg_grid)
coordinates(eberg) <- ~X+Y
proj4string(eberg) <- CRS("+init=epsg:31467")
gridded(eberg_grid) <- ~x+y
proj4string(eberg_grid) <- CRS("+init=epsg:31467")
# derive soil predictive components:
eberg_spc <- spc(eberg_grid, ~PRMGEO6+DEMSRT6+TWISRT6+TIRAST6)
# predict memberships:
formulaString = soiltype ~ PC1+PC2+PC3+PC4+PC5+PC6+PC7+PC8+PC9+PC10
eberg_sm <- spfkm(formulaString, eberg, eberg_spc@predicted)
## Not run: 
##D # plot memberships:
##D pal = seq(0, 1, 1/50)
##D spplot(eberg_sm@mu, col.regions=grey(rev(pal)))
##D # predict soil properties using memberships:
##D glm.formulaString = as.formula(paste("SNDMHT_A ~ ", 
##D     paste(names(eberg_sm@mu), collapse="+"), "-1"))
##D SNDMHT.m2 <- fit.gstatModel(observations=eberg, glm.formulaString, 
##D     covariates=eberg_sm@mu)
##D summary(SNDMHT.m2@regModel)
##D # Coefficients correspond to the class centres;
## End(Not run)



