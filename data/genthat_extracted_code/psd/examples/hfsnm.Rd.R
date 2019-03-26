library(psd)


### Name: hfsnm
### Title: Noise levels found in PBO strainmeter data at seismic
###   frequencies.
### Aliases: hfsnm
### Keywords: datasets

### ** Examples

data(hfsnm)
str(hfsnm)
FUN <- attr(hfsnm, "generator")
try(dat <- FUN(molten=FALSE)) # may fail without library-access to BSSA
try(all.equal(dat[,1:4], hfsnm[,1:4]))



