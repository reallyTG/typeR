library(hsdar)


### Name: speclib_raster-methods
### Title: Functions for processing large hyperspectral raster files
### Aliases: blockSize,Speclib-method getValuesBlock,Speclib-method
###   writeStart,Speclib,character-method
###   writeValues,Speclib,Speclib-method writeValues,Speclib,matrix-method
###   writeValues,Speclib,numeric-method writeStop,Speclib-method

### ** Examples
 
## Not run: 
##D ## Create raster file using PROSAIL
##D ## Run PROSAIL
##D parameter <- data.frame(N = c(rep.int(seq(0.5, 1.4, 0.1), 6)),
##D                         LAI = c(rep.int(0.5, 10), rep.int(1, 10), 
##D                                 rep.int(1.5, 10), rep.int(2, 10), 
##D                                 rep.int(2.5, 10), rep.int(3, 10)))
##D spectra <- PROSAIL(parameterList = parameter)
##D 
##D ## Create SpatialPixelsDataFrame and fill data with spectra from PROSAIL
##D rows <- round(nspectra(spectra)/10, 0)
##D cols <- ceiling(nspectra(spectra)/rows)
##D grd <- SpatialGrid(GridTopology(cellcentre.offset = c(1,1,1), 
##D                                 cellsize = c(1,1,1), 
##D                                 cells.dim = c(cols, rows, 1)))
##D x <- SpatialPixelsDataFrame(grd, data = as.data.frame(spectra(spectra)))
##D 
##D ## Write data to example file (example_in.tif) in workingdirectory
##D writeGDAL(x, fname = "example_in.tif", drivername = "GTiff")
##D 
##D ## Examples for Speclib using file example_in.tif
##D ## Example 1:
##D ## Noise reduction in spectra
##D infile <- "example_in.tif"
##D outfile <- "example_result_1.tif"
##D wavelength <- spectra$wavelength
##D 
##D ra <- speclib(infile, wavelength)
##D tr <- blockSize(ra)
##D 
##D res <- writeStart(ra, outfile, overwrite = TRUE)
##D for (i in 1:tr$n) 
##D {
##D   v <- getValuesBlock(ra, row=tr$row[i], nrows=tr$nrows[i])
##D   v <- noiseFiltering(v, method="sgolay", n=25)
##D   res <- writeValues(res, v, tr$row[i])
##D }
##D res <- writeStop(res)
##D 
##D ## Example 2:
##D ## masking spectra and calculating vegetation indices
##D outfile <- "example_result_2.tif" 
##D n_veg <- as.numeric(length(vegindex()))
##D res <- writeStart(ra, outfile, overwrite = TRUE, nl = n_veg)
##D for (i in 1:tr$n) 
##D {
##D   v <- getValuesBlock(ra, row=tr$row[i], nrows=tr$nrows[i])
##D   mask(v) <- c(1350, 1450)
##D   v <- as.matrix(vegindex(v, index=vegindex()))
##D   res <- writeValues(res, v, tr$row[i])
##D }
##D res <- writeStop(res)
## End(Not run)



