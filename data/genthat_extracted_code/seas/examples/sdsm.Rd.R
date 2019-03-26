library(seas)


### Name: sdsm
### Title: Read and write from SDSM
### Aliases: sdsm read.sdsm write.sdsm
### Keywords: file connection utilities

### ** Examples

## Not run: 
##D # reading
##D fname <- system.file("extdata", "GF_2050s_precip.OUT", package="seas")
##D gf50 <- read.sdsm(fname)
##D gf50.ss <- seas.sum(gf50, var=paste("V", 1:20, sep=""), name="Grand Forks")
##D 
##D # analysis
##D image(gf50.ss, var="V1")
##D image(gf50.ss, var="V2")
##D image(gf50.ss, var="V3")
##D 
##D # writing
##D data(mscdata)
##D hj <- mksub(mscdata, id=2100630)
##D fname <- paste(tempdir(), "HJ_Obs_prcp.DAT", sep="/")
##D write.sdsm(hj, "precip", 1961, 2000, fname)
## End(Not run)



