library(MSnbase)


### Name: writeMgfData-methods
### Title: Write an experiment or spectrum to an mgf file
### Aliases: writeMgfData writeMgfData-methods writeMgfData,MSnExp-method
###   writeMgfData,Spectrum-method
### Keywords: file methods

### ** Examples

  ## Not run: 
##D     data(itraqdata)
##D     writeMgfData(itraqdata,file="itraqdata.mgf",COM="MSnbase itraqdata")
##D     itraqdata2 <- readMgfData("itraqdata.mgf")
##D     ## note that the order of the spectra 
##D     ## and precision of some values (precursorMz for instance)
##D     ## are altered
##D     match(signif(precursorMz(itraqdata2),4),signif(precursorMz(itraqdata),4))
##D     ## [1]  1 10 11 12 13 14 15 16 17 18 ...
##D     ## ... but all the precursors are there
##D     all.equal(sort(precursorMz(itraqdata2)),sort(precursorMz(itraqdata)),
##D               check.attributes=FALSE,
##D               tolerance=10e-5)
##D     ## is TRUE
##D     all.equal(as.data.frame(itraqdata2[[1]]),as.data.frame(itraqdata[[1]]))
##D     ## is TRUE
##D     all.equal(as.data.frame(itraqdata2[[3]]),as.data.frame(itraqdata[[11]]))
##D     ## is TRUE
##D     ## But, beware that
##D     all(featureNames(itraqdata2)==featureNames(itraqdata))
##D     ## is TRUE too!
##D   
## End(Not run)



