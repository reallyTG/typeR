library(SSN)


### Name: mf04p
### Title: Imported SpatialStreamNetwork object from MiddleFork04.ssn data
###   folder
### Aliases: mf04p

### ** Examples

	library(SSN)
	#for examples, copy MiddleFork04.ssn directory to R's temporary directory
	copyLSN2temp()
	mf04p <- importSSN(paste0(tempdir(),'/MiddleFork04.ssn'), predpts = "pred1km",
		o.write = TRUE)
	mf04p <- importPredpts(target = mf04p, predpts = "CapeHorn", obj.type = "ssn")
	mf04p <- importPredpts(target = mf04p, predpts = "Knapp", obj.type = "ssn")
	names(mf04p)



