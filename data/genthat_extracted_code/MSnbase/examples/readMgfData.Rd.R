library(MSnbase)


### Name: readMgfData
### Title: Import mgf files as 'MSnExp' instances.
### Aliases: readMgfData
### Keywords: file

### ** Examples

  data(itraqdata)
  writeMgfData(itraqdata, con="itraqdata.mgf", COM="MSnbase itraqdata")
  itraqdata2 <- readMgfData("itraqdata.mgf")
  ## note that the order of the spectra is altered
  ## and precision of some values (precursorMz for instance)
  match(signif(precursorMz(itraqdata2),4),signif(precursorMz(itraqdata),4))
  ## [1]  1 10 11 12 13 14 15 16 17 18 ...
  ## ... but all the precursors are there
  all.equal(sort(precursorMz(itraqdata2)),
            sort(precursorMz(itraqdata)),
            check.attributes=FALSE,
            tolerance=10e-5)
  ## is TRUE
  all.equal(as.data.frame(itraqdata2[[1]]),as.data.frame(itraqdata[[1]]))
  ## is TRUE
  all.equal(as.data.frame(itraqdata2[[3]]),as.data.frame(itraqdata[[11]]))
  ## is TRUE
  f <- dir(system.file(package="MSnbase",dir="extdata"),
           full.name=TRUE,
           pattern="test.mgf")
  (x <- readMgfData(f))
  x[[2]]
  precursorMz(x[[2]])
  precursorIntensity(x[[2]])
  precursorMz(x[[1]])
  precursorIntensity(x[[1]]) ## was not in test.mgf
  scanIndex(x)



