library(SSN)


### Name: Torgegram
### Title: Empirical Semivariogram Based on Hydrologic Distance and flow
###   connection
### Aliases: Torgegram

### ** Examples


	library(SSN)
	#for examples, copy MiddleFork04.ssn directory to R's temporary directory
	copyLSN2temp()
	# NOT RUN
	# Create a SpatialStreamNetork object that also contains prediction sites
	#mf04p <- importSSN(paste0(tempdir(),'/MiddleFork04.ssn'), 
	#  predpts = "pred1km", o.write = TRUE)
	#use mf04p SpatialStreamNetwork object, already created
	data(mf04p)
	#for examples only, make sure mf04p has the correct path
	#if you use importSSN(), path will be correct
	mf04p <- updatePath(mf04p, paste0(tempdir(),'/MiddleFork04.ssn'))

	ESVF <- Torgegram(mf04p, "Summer_mn")
	plot(ESVF)

	ESVF <- Torgegram(mf04p, "Summer_mn", maxlag = 20000, nlag = 10)
	plot(ESVF, sp.relationship = "fc", col = "red", main = "Flow-connected Torgegram")
	plot(ESVF, sp.relationship = "fu", min.cex = .4, max.cex = 8,
		   main = "Flow-unconnected Torgegram")
	plot(ESVF, min.cex = .4, max.cex = 8, col = c("darkgray", "black"),
		   main = "", xlab = "Stream Distance (m)")

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

	resids <- residuals(fitSp)
	names(resids$ssn.object)
	ESVF <- Torgegram(resids, "_resid_", maxlag = 20000,
		  nlag = 10)
	plot(ESVF, xlim = c(0,10000))




