library(WhiteStripe)


### Name: t2.voi.hist
### Title: t2.voi.hist
### Aliases: t2.voi.hist
### Keywords: datasets

### ** Examples

## Not run: 
##D lib.loc = tempdir() 
##D if (download_img_data(lib.loc = lib.loc)){
##D t2 = readNIfTI(system.file("T2Strip.nii.gz", package="WhiteStripe",
##D lib.loc = lib.loc))
##D t2.voi = make_img_voi(t2)
##D any(is.na(t2.voi))
##D # FALSE 
##D t2.voi.hist = hist(t2.voi, 
##D breaks=2000, 
##D plot=FALSE)  
##D #save(t2.voi.hist, file="data/t2.voi.hist.rda", compress = TRUE,
##D # compression_level=9) 
##D }
## End(Not run) 



