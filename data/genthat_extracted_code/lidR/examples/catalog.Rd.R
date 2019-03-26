library(lidR)


### Name: catalog
### Title: Create an object of class LAScatalog
### Aliases: catalog

### ** Examples

# A single file LAScatalog using data provided with the package
LASfile <- system.file("extdata", "Megaplot.laz", package="lidR")
ctg = catalog(LASfile)
plot(ctg)

## Not run: 
##D ctg <- catalog("/path/to/a/folder/of/las/files")
##D 
##D # Internal engine will compute in parallel using two cores
##D opt_cores(ctg) <- 2L
##D 
##D # Internal engine will sequentially process regions of interest of size 500 x 500 m (clusters)
##D opt_chunk_size(ctg) <- 500
##D 
##D # Internal engine will align the 500 x 500 m clusters on x = 250 and y = 300
##D opt_alignment(ctg) <- c(250, 300)
##D 
##D # Internal engine will not display a progress estimation
##D opt_progress(ctg) <- FALSE
##D 
##D # Internal engine will not return results into R. Instead it will write results in files.
##D opt_output_files(ctg) <- "/path/to/folder/templated_filename_{XBOTTOM}_{ID}"
##D 
##D # More details in the documentation
##D help("LAScatalog-class", "lidR")
##D help("catalog_options_tools", "lidR")
## End(Not run)



