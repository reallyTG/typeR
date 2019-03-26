library(McSpatial)


### Name: geodensity
### Title: Kernel density functions for geo-coded data
### Aliases: geodensity
### Keywords: Density Functions Nonparametric

### ** Examples

## Not run: 
##D library(spdep)
##D library(RColorBrewer)
##D cook <- readShapePoly(system.file("maps/CookCensusTracts.shp",package="McSpatial"))
##D # measure distance to Chicago city center
##D lmat <- coordinates(cook)
##D cook$longitude <- lmat[,1]
##D cook$latitude  <- lmat[,2]
##D fit <- geodensity(cook$longitude, cook$latitude)
##D cook$denshat <- fit$denshat
##D brks <- seq(min(cook$denshat,na.rm=TRUE),max(cook$denshat,na.rm=TRUE),length=9)
##D spplot(cook,"denshat",at=brks,col.regions=rev(brewer.pal(9,"RdBu")),
##D   main="Census Tract Densities")
## End(Not run)



