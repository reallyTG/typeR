library(SSN)


### Name: getPreds
### Title: Extract Predictions with associated standard errors.
### Aliases: getPreds

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

# get some model fits stored as data objects
data(modelFits)
#NOT RUN use this one
#fitSp <- glmssn(Summer_mn ~ ELEV_DEM + netID,
#    ssn.object = mf04p, EstMeth = "REML", family = "Gaussian",
#    CorModels = c("Exponential.tailup","Exponential.taildown",
#    "Exponential.Euclid"), addfunccol = "afvArea")
#Update the path in fitSp, will vary for each users installation
fitSp$ssn.object <- updatePath(fitSp$ssn.object, 
  paste0(tempdir(),'/MiddleFork04.ssn'))

# Extract predictions and standard errors for the prediction sites
# make sure the distance matrix is there
createDistMat(mf04p, predpts = "pred1km", o.write = TRUE)
#create predictions
fitSpPred <- predict(fitSp, predpointsID = "pred1km")
class(fitSpPred)
fitSpgetPreds <- getPreds(fitSpPred, pred.type = "pred")
head(fitSpgetPreds)

# Extract cross-validation predictions for the observed sites in two ways:
fitSpRes <- residuals(fitSp)
class(fitSpRes)

# Extract from the influenceSSN class object
fitSpResGetCV <- getPreds(fitSpRes, pred.type = "cv")
head(fitSpResGetCV)

# Extract from the glmssn.predict class object
fitSpResGetCV2 <- getPreds(fitSpPred, pred.type = "cv")
# These values are identical
identical(fitSpResGetCV,fitSpResGetCV) ## TRUE




