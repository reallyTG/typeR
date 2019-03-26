library(neurobase)


### Name: replace_dropped_dimensions
### Title: Remake Dropped Dimensions
### Aliases: replace_dropped_dimensions

### ** Examples

## Not run: 
##D # nim is an object of class nifti
##D dd = dropEmptyImageDimensions(nim, keep_ind = TRUE)
##D remake = replace_dropped_dimensions(img = dd$outimg, 
##D inds = dd$inds,
##D orig.dim = dd$orig.dim)
##D all.equal(nim, remake)
## End(Not run)



