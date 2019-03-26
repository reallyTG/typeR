library(WhiteStripe)


### Name: whitestripe_hybrid
### Title: Hybrid WhiteStripe
### Aliases: whitestripe_hybrid hybrid
### Keywords: hybrid, whitestripe

### ** Examples

## Not run: 
##D lib.loc = tempdir()
##D if (download_img_data(lib.loc = lib.loc)){
##D t1 = readNIfTI(system.file("T1Strip.nii.gz", package="WhiteStripe", 
##D lib.loc = lib.loc))
##D t2 = readNIfTI(system.file("T2Strip.nii.gz", package="WhiteStripe",
##D lib.loc = lib.loc))
##D ind = whitestripe_hybrid(t1, t2)
##D }
## End(Not run)



