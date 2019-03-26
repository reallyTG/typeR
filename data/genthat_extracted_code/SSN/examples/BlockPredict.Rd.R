library(SSN)


### Name: BlockPredict
### Title: Block Predicton for Streams Data
### Aliases: BlockPredict

### ** Examples


## Not run: 
##D library(SSN)
##D #for examples, copy MiddleFork04.ssn directory to R's temporary directory
##D copyLSN2temp()
##D # NOT RUN
##D # Create a SpatialStreamNetork object that also contains prediction sites
##D #mf04p <- importSSN(paste0(tempdir(),'/MiddleFork04.ssn'), 
##D #  predpts = "pred1km", o.write = TRUE)
##D #use mf04p SpatialStreamNetwork object, already created
##D data(mf04p)
##D #for examples only, make sure mf04p has the correct path
##D #if you use importSSN(), path will be correct
##D mf04p <- updatePath(mf04p, paste0(tempdir(),'/MiddleFork04.ssn'))
##D 
##D # Not needed: already added,
##D # add densely gridded prediction points for two stream segments
##D # mf04p <- importPredpts(mf04p, "Knapp", "ssn")
##D # mf04p <- importPredpts(mf04p, "CapeHorn", "ssn")
##D names(mf04p)
##D 
##D # see densely gridded prediction points on stream
##D plot(mf04p, PredPointsID = "Knapp")
##D 
##D #  you could fit the model
##D #fitSpBk <- glmssn(Summer_mn ~ ELEV_DEM + netID,
##D #    ssn.object = mf04p, EstMeth = "REML", family = "Gaussian",
##D #    CorModels = c("Exponential.tailup","Exponential.taildown",
##D #    "Exponential.Euclid"), addfunccol = "afvArea")
##D 
##D # or load the pre-fit model
##D data(modelFits)
##D fitSpBk$ssn.object <- updatePath(fitSpBk$ssn.object, 
##D 	paste0(tempdir(),'/MiddleFork04.ssn'))
##D 
##D # one-at-a-time predictions for CapeHorn stream
##D ## NOTE: need the amongpreds distance matrices for block prediction
##D createDistMat(mf04p, predpts = "CapeHorn", o.write = TRUE, amongpreds = TRUE)
##D fitSpPredC <- predict(fitSpBk, "CapeHorn")
##D # plot densely gridded prediction points on stream
##D plot(fitSpPredC, "Summer_mn")
##D # block prediction for CapeHorn stream
##D BlockPredict(fitSpBk, "CapeHorn")
##D 
##D ## Another example
##D # one-at-a-time predictions for Knapp stream
##D createDistMat(mf04p, predpts = "Knapp", o.write = TRUE, amongpreds = TRUE)
##D fitSpPredK <- predict(fitSpBk, "Knapp")
##D # plot densely gridded prediction points on stream
##D plot(fitSpPredK, "Summer_mn")
##D # block prediction for Knapp stream
##D BlockPredict(fitSpBk, "Knapp")
## End(Not run)



