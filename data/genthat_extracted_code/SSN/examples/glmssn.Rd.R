library(SSN)


### Name: glmssn
### Title: Fitting Generalized Linear Models for Spatial Stream Networks
### Aliases: glmssn

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

# The models take a little time to fit, so they are NOT RUN
# Uncomment the code to run them
# Alternatively, you can load the fitted models first to look at results
data(modelFits)

## Non-spatial model
# fitNS <- glmssn(Summer_mn ~ ELEV_DEM + netID,
#    ssn.object = mf04p, CorModels = NULL, 
#    EstMeth = "REML", family = "Gaussian")
#for examples only, make sure fitNS has the correct path
#if you use importSSN(), path will be correct
fitNS$ssn.object <- updatePath(fitNS$ssn.object, 
	paste0(tempdir(),'/MiddleFork04.ssn'))
summary(binSp)

summary(fitNS)

## Random effect model using STREAMNAME as our random effect
#fitRE <- glmssn(Summer_mn ~ ELEV_DEM + netID,
#    ssn.object = mf04p, EstMeth = "REML", family = "Gaussian",
#    CorModels = c("STREAMNAME"))
#for examples only, make sure fitRE has the correct path
#if you use importSSN(), path will be correct
fitRE$ssn.object <- updatePath(fitRE$ssn.object, 
	paste0(tempdir(),'/MiddleFork04.ssn'))
summary(fitRE)
## random effects details
fitREBLUP <- BLUP(fitRE)
str(fitREBLUP)
fitREBLUP$Mean

## Basic spatial model with a random effect
#fitSpRE1 <- glmssn(Summer_mn ~ ELEV_DEM + netID,
#    ssn.object = mf04p, EstMeth = "REML", family = "Gaussian",
#    CorModels = c("STREAMNAME","Exponential.Euclid"))
#for examples only, make sure fitSpRE1 has the correct path
#if you use importSSN(), path will be correct
fitSpRE1$ssn.object <- updatePath(fitSpRE1$ssn.object, 
	paste0(tempdir(),'/MiddleFork04.ssn'))
summary(fitSpRE1)

## Spatial stream tail-up model with a random effect
#fitSpRE2 <- glmssn(Summer_mn ~ ELEV_DEM + netID,
#    ssn.object = mf04p, EstMeth = "REML", family = "Gaussian",
#    CorModels = c("STREAMNAME","Exponential.tailup"),
#    addfunccol = "afvArea")
#for examples only, make sure fitSpRE2 has the correct path
#if you use importSSN(), path will be correct
fitSpRE2$ssn.object <- updatePath(fitSpRE2$ssn.object, 
	paste0(tempdir(),'/MiddleFork04.ssn'))
summary(fitSpRE2)

## 3 component spatial model
#fitSp <- glmssn(Summer_mn ~ ELEV_DEM + netID,
#    ssn.object = mf04p, EstMeth = "REML", family = "Gaussian",
#    CorModels = c("Exponential.tailup","Exponential.taildown",
#    "Exponential.Euclid"), addfunccol = "afvArea")
#for examples only, make sure fitSp has the correct path
#if you use importSSN(), path will be correct
fitSp$ssn.object <- updatePath(fitSp$ssn.object, 
	paste0(tempdir(),'/MiddleFork04.ssn'))


## Summarise last model
summary(fitSp)

## AIC for last model
AIC(fitSp)

## Generalised R-squared for last model
GR2(fitSp)

## Look at variance components in more detail
covparms(fitSp)
varcomp(fitSp)

## Compare models
InfoCritCompare(list(fitNS, fitRE, fitSpRE1, fitSpRE2, fitSp))

## Fit a model to binary data
#binSp <- glmssn(MaxOver20 ~ ELEV_DEM + SLOPE, mf04p,
#  CorModels = c("Mariah.tailup", "Spherical.taildown"),
#  family = "binomial", addfunccol = "afvArea")
#for examples only, make sure binSp has the correct path
#if you use importSSN(), path will be correct
binSp$ssn.object <- updatePath(binSp$ssn.object, 
	paste0(tempdir(),'/MiddleFork04.ssn'))
summary(binSp)

## Fit a model to count data
#poiSp <- glmssn(C16 ~ ELEV_DEM + SLOPE, mf04p,
#  CorModels = c("LinearSill.tailup", "LinearSill.taildown"),
#  family = "poisson", addfunccol = "afvArea")
#for examples only, make sure poiSp has the correct path
#if you use importSSN(), path will be correct
poiSp$ssn.object <- updatePath(poiSp$ssn.object, 
	paste0(tempdir(),'/MiddleFork04.ssn'))
summary(poiSp)




