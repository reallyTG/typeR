library(hsdar)


### Name: cubePlot
### Title: cubePlot
### Aliases: cubePlot
### Keywords: utilities

### ** Examples

## Not run: 
##D ## Create raster file using PROSPECT D
##D ## Run PROSPECT for 1600 random chlorophyll content values
##D parameter <- data.frame(Cab = round(runif(1600, min = 10, max = 40), 0))
##D spectra <- PROSPECT(parameterList = parameter)
##D ## Create SpatialPixelsDataFrame and fill data with spectra from PROSPECT
##D rows <- round(nspectra(spectra)/40, 0)
##D cols <- ceiling(nspectra(spectra)/rows)
##D grd <- SpatialGrid(GridTopology(cellcentre.offset = c(1,1,1),
##D cellsize = c(1,1,1),
##D cells.dim = c(cols, rows, 1)))
##D x <- SpatialPixelsDataFrame(grd, data = as.data.frame(spectra(spectra)))
##D ## Write data to example file (example_in.tif) in workingdirectory
##D writeGDAL(x, fname = "example_in.tif", drivername = "GTiff")
##D 
##D ## Read the raster and plot 3D cube
##D wavelength <- wavelength(spectra)
##D ras <- speclib("example_in.tif", wavelength)
##D 
##D cubePlot(ras)
## End(Not run)



