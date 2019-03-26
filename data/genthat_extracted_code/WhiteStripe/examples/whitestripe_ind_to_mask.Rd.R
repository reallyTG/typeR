library(WhiteStripe)


### Name: whitestripe_ind_to_mask
### Title: WhiteStripe Indices to Mask
### Aliases: whitestripe_ind_to_mask whitemask
### Keywords: hybrid, whitestripe

### ** Examples

## Not run: 
##D lib.loc = tempdir()
##D 
##D if (download_img_data(lib.loc = lib.loc)){
##D t1 = readNIfTI(system.file("T1Strip.nii.gz", package="WhiteStripe",
##D lib.loc = lib.loc))
##D t2 = readNIfTI(system.file("T2Strip.nii.gz", package="WhiteStripe",
##D lib.loc = lib.loc))
##D ind = whitestripe_hybrid(t1, t2)
##D mask = whitestripe_ind_to_mask(t1, ind$whitestripe.ind)
##D orthographic(mask)
##D }
## End(Not run)



