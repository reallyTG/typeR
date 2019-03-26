library(SSN)


### Name: getSSNdata.frame
### Title: Extract data from SSN objects as a data.frame
### Aliases: getSSNdata.frame

### ** Examples

library(SSN)
#for examples, copy MiddleFork04.ssn directory to R's temporary directory
copyLSN2temp()
# NOT RUN
# Create a SpatialStreamNetork object that also contains prediction sites
#mf04 <- importSSN(paste0(tempdir(),'/MiddleFork04.ssn', o.write = TRUE))
#use mf04 SpatialStreamNetwork object, already created
data(mf04)
#for examples only, make sure mf04p has the correct path
#if you use importSSN(), path will be correct
mf04 <- updatePath(mf04, paste0(tempdir(),'/MiddleFork04.ssn'))

obsDF <- getSSNdata.frame(mf04)
head(obsDF)

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

# Get the data.frame from an influenceSSN object and plot the residuals
fitSpRes <- residuals(fitSp)
fitSpResDF <- getSSNdata.frame(fitSpRes)
# NOT RUN
#plot(fitSpResDF[,"_resid.crossv_"],fitSpResDF[,"_resid_"], pch = 19,
#  ylab = "Cross-validation Residuals", xlab = "Raw Residuals")

# Get the data.frame for the prediction locations
fitSpPred <- predict(fitSp, predpointsID = "pred1km")
predNames<- fitSpPred$ssn.object@predpoints@ID
fitSpPredDF <- getSSNdata.frame(fitSpPred, predNames[1])
head(fitSpPredDF)




