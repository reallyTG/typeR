library(GSIF)


### Name: spmultinom
### Title: Multinomial logistic regression on spatial objects
### Aliases: spmultinom
###   spmultinom,formula,SpatialPointsDataFrame,SpatialPixelsDataFrame-method
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
eberg_sm <- spmultinom(formulaString, eberg, eberg_spc@predicted)
## Not run: 
##D # plot memberships:
##D pal = seq(0, 1, 1/50)
##D spplot(eberg_sm@mu, col.regions=pal)
##D image(eberg_sm@mu[1], col=pal)
##D text(eberg@coords, paste(eberg$soiltype), cex=.6, col="black")
##D # classes predicted:
##D Ls = length(levels(eberg_sm@predicted$soiltype))
##D pnts = list("sp.points", eberg, pch="+", cex=.6, col="black")
##D spplot(eberg_sm@predicted, col.regions=rainbow(Ls)[rank(runif(Ls))], sp.layout=pnts)
## End(Not run)



