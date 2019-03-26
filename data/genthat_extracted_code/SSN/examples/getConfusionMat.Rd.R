library(SSN)


### Name: getConfusionMat
### Title: Extract confusion matrix for binary spatial model predictions.
### Aliases: getConfusionMat

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

# get some model fits stored as data objects
data(modelFits)

## NOT RUN
## Fit a model to binary data
## binSp <- glmssn(MaxOver20 ~ ELEV_DEM + SLOPE, mf04p,
##   CorModels = c("Mariah.tailup", "Spherical.taildown"),
##   family = "binomial", addfunccol = "afvArea")

#for examples only, make sure binSp has the correct path
#if you use importSSN(), path will be correct
binSp$ssn.object <- updatePath(binSp$ssn.object, 
	paste0(tempdir(),'/MiddleFork04.ssn'))
summary(binSp)

## Generate the leave-one-out cross-validation prediction residuals
## for the observed sites.
binResids <- residuals(binSp, cross.validation = TRUE)

## Generate the confusion matrix for the binary spatial
## model, based on the observations and leave-one-out
## cross-validation predictions
getConfusionMat(binResids, threshold = 0.5)



