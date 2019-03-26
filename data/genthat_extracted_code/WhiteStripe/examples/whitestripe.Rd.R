library(WhiteStripe)


### Name: whitestripe
### Title: Performs White Stripe of T1 or T2 Images
### Aliases: whitestripe

### ** Examples

## Not run: 
##D library(WhiteStripe)
##D lib.loc = tempdir()
##D if (WhiteStripe::download_img_data(lib.loc = lib.loc)){
##D library(oro.nifti)
##D set.seed(1)
##D t1 = readNIfTI(system.file("T1Strip.nii.gz", package="WhiteStripe",
##D lib.loc = lib.loc))
##D t1.ind = whitestripe(t1, "T1")
##D set.seed(2)
##D t1_2 = readNIfTI(system.file("T1Strip.nii.gz", package="WhiteStripe",
##D lib.loc = lib.loc))
##D t1_2.ind = whitestripe(t1_2, "T1") 
##D t1.mask = whitestripe_ind_to_mask(t1, t1.ind$whitestripe.ind)
##D t1.mask[t1.mask == 0] = NA
##D orthographic(t1, t1.mask, col.y="red")
##D t2 = readNIfTI(system.file("T2Strip.nii.gz", package="WhiteStripe",
##D lib.loc = lib.loc))
##D t2.ind = whitestripe(t2, "T2")
##D t2.mask = whitestripe_ind_to_mask(t2, t2.ind$whitestripe.ind)
##D t2.mask[t2.mask == 0] = NA
##D orthographic(t2, t2.mask, col.y="red")
##D }
## End(Not run)



