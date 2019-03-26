library(RStoolbox)


### Name: saveRSTBX
### Title: Save and Read RStoolbox Classification Results
### Aliases: saveRSTBX readRSTBX

### ** Examples

## Not run: 
##D input <- brick(system.file("external/rlogo.grd", package="raster"))
##D ## Create filename
##D file  <- paste0(tempdir(), "/test", runif(1))
##D ## Run PCA
##D rpc   <- rasterPCA(input, nSample = 100)
##D ## Save object
##D saveRSTBX(rpc, filename=file)
##D ## Which files were written?
##D list.files(tempdir(), pattern = basename(file))
##D ## Re-read files
##D re_rpc <- readRSTBX(file)
##D ## Remove files 
##D file.remove(list.files(tempdir(), pattern = basename(file), full = TRUE))
## End(Not run)



