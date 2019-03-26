library(hsdar)


### Name: SI
### Title: Handling supplementary information (SI) of spectra
### Aliases: SI SI.speclib SI,Speclib-method SI,Nri-method
###   SI,Nri,ANY,ANY-method SI,Nri,ANY,missing-method
###   SI,Nri,missing,ANY-method SI,Nri,missing,missing-method
###   SI,Speclib,ANY,ANY-method SI,Speclib,ANY,missing-method
###   SI,Speclib,missing,ANY-method SI,Speclib,missing,missing-method SI<-
###   SI<-,Speclib,data.frame-method SI<-,Speclib,matrix-method
###   SI<-,Speclib,ANY-method SI<-,Nri,ANY-method
###   SI<-,Nri,data.frame-method SI<-,Nri,matrix-method
###   [,.SI,ANY,ANY,ANY-method initialize,.SI-method names,.SI-method
###   ncol,.SI-method nrow,.SI-method
### Keywords: utilities

### ** Examples

data(spectral_data)

## Returning SI
si_spec <- SI(spectral_data)
head(si_spec)

## Adding new SI item
SI(spectral_data)$MeasurementID <- c(1:nspectra(spectral_data))
head(SI(spectral_data))

## Replacing SI
SI(spectral_data) <- SI(spectral_data)[,c(1:3)]
head(SI(spectral_data))

## Adding SI to a Speclib without SI
spec_new <- speclib(spectra(spectral_data), wavelength(spectral_data))
## This throws an error
#SI(spec_new)$NewColumn <- 1:nspectra(spec_new)
## This works:
SI(spec_new) <- data.frame(NewColumn = 1:nspectra(spec_new))
## Now, you can add a column as explained above:
SI(spec_new)$SecondCol <- c(1:nspectra(spec_new))*100
## Print SI
SI(spec_new)

## Not run: 
##D ## Example for raster file in SI
##D 
##D ## Create raster file using PROSAIL
##D ## Run PROSAIL
##D parameter <- data.frame(N = c(rep.int(seq(0.5, 1.4, 0.1), 6)),
##D                         LAI = c(rep.int(0.5, 10), rep.int(1, 10), 
##D                                 rep.int(1.5, 10), rep.int(2, 10), 
##D                                 rep.int(2.5, 10), rep.int(3, 10)))
##D spectra <- PROSAIL(parameterList = parameter)
##D 
##D ## Create SpatialPixelsDataFrame and fill data with spectra from 
##D ## PROSAIL
##D rows <- round(nspectra(spectra)/10, 0)
##D cols <- ceiling(nspectra(spectra)/rows)
##D grd <- SpatialGrid(GridTopology(cellcentre.offset = c(1,1,1), 
##D                                 cellsize = c(1,1,1), 
##D                                 cells.dim = c(cols, rows, 1)))
##D x <- SpatialPixelsDataFrame(grd, 
##D                             data = as.data.frame(spectra(spectra)))
##D 
##D ## Write data to example file (example_in.tif) in workingdirectory
##D writeGDAL(x, fname = "example_in.tif", drivername = "GTiff")
##D 
##D infile <- "example_in.tif"
##D wavelength <- wavelength(spectra)
##D ra <- speclib(infile, wavelength)
##D tr <- blockSize(ra)
##D 
##D ## Write LAI to separate raster file
##D LAI <- SI(spectra)$LAI
##D SI_file <- "example_SI.tif" 
##D SI_raster <- setValues(raster(infile), LAI)
##D SI_raster <- writeRaster(SI_raster, SI_file)
##D 
##D ## Read LAI file and calculate NDVI for each pixel where LAI >= 1
##D outfile <- "example_result_ndvi.tif" 
##D SI(ra) <- raster(SI_file)
##D names(SI(ra)) <- "LAI"
##D res <- writeStart(ra, outfile, overwrite = TRUE, nl = 1)
##D for (i in 1:tr$n) 
##D {
##D   v <- getValuesBlock(ra, row=tr$row[i], nrows=tr$nrows[i])
##D   mask(v) <- c(1350, 1450)
##D   LAI <- SI(v)$LAI
##D   v <- as.matrix(vegindex(v, index="NDVI"))
##D   v[LAI <= 1] <- NA
##D   res <- writeValues(res, v, tr$row[i])
##D }
##D res <- writeStop(res)
## End(Not run)



