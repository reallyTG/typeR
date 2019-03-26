library(WhiteStripe)


### Name: t1.voi.hist
### Title: t1.voi.hist
### Aliases: t1.voi.hist
### Keywords: datasets

### ** Examples

## Not run: 
##D lib.loc = tempdir() 
##D if (download_img_data(lib.loc = lib.loc)){
##D t1 = readNIfTI(system.file("T1Strip.nii.gz", package="WhiteStripe",
##D lib.loc = lib.loc))
##D t1.voi = make_img_voi(t1)
##D any(is.na(t1.voi))
##D # FALSE
##D t1.voi.hist = hist(t1.voi, 
##D breaks=2000, 
##D plot=FALSE) 
##D #save(t1.voi.hist, file="data/t1.voi.hist.rda", compress = TRUE,
##D # compression_level=9)
##D }
## End(Not run) 



