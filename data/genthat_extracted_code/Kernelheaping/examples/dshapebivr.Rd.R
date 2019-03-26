library(Kernelheaping)


### Name: dshapebivr
### Title: Bivariate Kernel density estimation for data classified in
###   polygons or shapes
### Aliases: dshapebivr

### ** Examples

## Not run: 
##D library(maptools)
##D 
##D # Read Shapefile of Berlin Urban Planning Areas (download available from:
##D # https://www.statistik-berlin-brandenburg.de/opendata/RBS_OD_LOR_2015_12.zip)
##D Berlin <- rgdal::readOGR("X:/SomeDir/RBS_OD_LOR_2015_12.shp") #(von daten.berlin.de)
##D 
##D # Get Dataset of Berlin Population (download available from:
##D # https://www.statistik-berlin-brandenburg.de/opendata/EWR201512E_Matrix.csv)
##D data <- read.csv2("X:/SomeDir/EWR201512E_Matrix.csv")
##D 
##D # Form Dataset for Estimation Process
##D dataIn <- cbind(t(sapply(1:length(Berlin@polygons),
##D  function(x) Berlin@polygons[[x]]@labpt)), data$E_E65U80)
##D 
##D #Estimate Bivariate Density
##D Est <- dshapebivr(data = dataIn, burnin = 5, samples = 10, adaptive = FALSE,
##D                  shapefile = Berlin, gridsize = 325, boundary = TRUE)
## End(Not run)

# Plot Density over Area:
## Not run: 
##D breaks <- seq(1E-16,max(Est$Mestimates$estimate),length.out = 20)
##D image.plot(x=Est$Mestimates$eval.points[[1]],y=Est$Mestimates$eval.points[[2]],
##D           z=Est$Mestimates$estimate, asp=1, breaks = breaks,
##D           col =  colorRampPalette(brewer.pal(9,"YlOrRd"))(length(breaks)-1))
##D plot(Berlin, add=TRUE)
## End(Not run)



