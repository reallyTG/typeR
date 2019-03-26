library(MSnID)


### Name: msnidObj
### Title: Example mzIdenML File and MSnID Object
### Aliases: msnidObj c_elegans
### Keywords: datasets

### ** Examples

data(c_elegans)
msnidObj


## Not run: 
##D ## How to download the example mzID file from PeptideAltas:
##D try(setInternet2(FALSE),silent=TRUE)
##D ftp.loc <- "ftp://PASS00308:PJ5348t@ftp.peptideatlas.org/MSGFPlus_Results/MZID_Files/c_elegans_A_3_1_21Apr10_Draco_10-03-04_msgfplus.mzid.gz"
##D download.file(ftp.loc, "c_elegans.mzid.gz")
## End(Not run)

## Not run: 
##D ## Script for generation of the example data:
##D msnidObj <- MSnID(".")
##D mzids <- system.file("extdata","c_elegans.mzid.gz",package="MSnID")
##D msnidObj <- read_mzIDs(msnidObj, mzids)
##D save(msnidObj, file='c_elegans.RData', compress='xz', compression_level=9)
##D # MD5 sum for the file is: a7c511a6502a6419127f1e46db48ed92
##D digest::digest(msnidObj)
##D # clean up the cache directory
##D unlink(".Rcache", recursive=TRUE)
## End(Not run)




