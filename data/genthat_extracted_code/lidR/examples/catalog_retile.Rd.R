library(lidR)


### Name: catalog_retile
### Title: Retile a LAScatalog
### Aliases: catalog_retile

### ** Examples

## Not run: 
##D ctg = catalog("path/to/catalog")
##D 
##D # Create a new set of .las files 500 x 500 wide in the folder
##D # path/to/new/catalog/ and iteratively named Forest_1.las, Forest_2.las
##D # Forest_3.las, and so on.
##D 
##D opt_chunk_buffer(ctg) <- 0
##D opt_chunk_size(ctg) <- 500
##D opt_output_files(ctg) <- "path/to/new/catalog/Forest_{ID}
##D newctg = catalog_retile(ctg)
##D 
##D # Create a new set of .las files equivalent to the original,
##D # but extended with a 50 m buffer in the folder path/to/new/catalog/
##D # and iteratively named named after the original files.
##D 
##D opt_chunk_buffer(ctg) <- 50
##D opt_chunk_size(ctg) <- 0
##D opt_output_files(ctg) <- "path/to/new/catalog/{ORIGINALFILENAME}_buffered
##D newctg = catalog_retile(ctg)
##D 
##D # Create a new set of compressed .laz file equivalent to the original, keeping only
##D # first returns above 2 m
##D 
##D opt_chunk_buffer(ctg) <- 0
##D opt_chunk_size(ctg) <- 0
##D opt_laz_compression(ctg) <- TRUE
##D opt_filter(ctg) <- "-keep_first -drop_z_below 2"
##D newctg = catalog_retile(ctg)
## End(Not run)



