library(lidR)


### Name: LAScatalog-class
### Title: An S4 class to represent a catalog of .las or .laz files
### Aliases: LAScatalog-class

### ** Examples

## Not run: 
##D # Build a catalog
##D ctg <- catalog("filder/to/las/files/")
##D 
##D # Set some options
##D opt_cores(ctg) <- 2
##D opt_filter(ctg) <- "-keep_first"
##D 
##D # Summary gives a summary of how the catalog will be processed
##D summary(ctg)
##D 
##D # We can seamlessly use lidR functions
##D hmean <- grid_metrics(ctg, mean(Z), 20)
##D ttops <- tree_detection(ctg, lmf(5))
##D 
##D # For low memory config it is probably advisable not to load entire files
##D # and process chunks instead
##D opt_cores(ctg) <- 1
##D opt_chunk_size(ctg) <- 500
##D 
##D # Outputs are expected to be strictly identical
##D hmean <- grid_metrics(ctg, mean(Z), 20)
##D ttops <- tree_detection(ctg, lmf(5))
##D 
##D # Sometimes the output is likely to be very large
##D dtm <- grid_terrain(ctg, 1, tin())
##D 
##D # In that case it is advisable to write the output(s) to files
##D opt_output_files(ctg) <- "path/to/folder/DTM_chunk_{XLEFT}_{YBOTTOM}"
##D 
##D # Raster will be written to disk. The list of written files is returned
##D # or, in this specific case, a virtual raster mosaic.
##D dtm <- grid_terrain(ctg, 1, tin())
##D 
##D # When chunks are files the original names of the las files can be preserved
##D opt_chunk_size(ctg) <- 0
##D opt_output_files(ctg) <- "path/to/folder/DTM_{ORIGINALFILENAME}"
##D dtm <- grid_terrain(ctg, 1, tin())
##D 
##D # For some functions, files MUST be written to disk. Indeed, it is certain that R cannot
##D # handle the entire output.
##D opt_chunk_size(ctg) <- 0
##D opt_output_files(ctg) <- "path/to/folder/{ORIGINALFILENAME}_norm"
##D opt_laz_compression(ctg) <- TRUE
##D new_ctg <- lasnormalize(ctg, tin())
##D 
##D # The user has access to the catalog engine through the function catalog_apply
##D output <- catalog_apply(ctg, FUN, ...)
## End(Not run)



