library(SSN)


### Name: summary.glmssn
### Title: Summary - S3 Method for Class 'glmssn'
### Aliases: summary.glmssn

### ** Examples


	library(SSN)
	# get some model fits stored as data objects
	data(modelFits)
	#NOT RUN use this one
	#fitSp <- glmssn(Summer_mn ~ ELEV_DEM + netID,
	#    ssn.object = mf04p, EstMeth = "REML", family = "Gaussian",
	#    CorModels = c("Exponential.tailup","Exponential.taildown",
	#    "Exponential.Euclid"), addfunccol = "afvArea")
	#for examples only, make sure fitSp has the correct path
	#if you use importSSN(), path will be correct
	fitSp$ssn.object <- updatePath(fitSp$ssn.object, 
		paste0(tempdir(),'/MiddleFork04.ssn'))
	names(fitSp)
	names(fitSp$ssn.object)

  summary(fitSp)




