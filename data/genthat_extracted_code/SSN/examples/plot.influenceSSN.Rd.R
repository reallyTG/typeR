library(SSN)


### Name: plot.influenceSSN
### Title: Plotting Method for influenceSSN Objects
### Aliases: plot.influenceSSN

### ** Examples


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

resids <- residuals(fitSp,cross.validation = TRUE)
plot(resids)

## plot using user-defined breakpoints
brks <- seq(-3,2,by=1)
plot(resids, nclasses = 6, inflcol = "_resid_",
    breaktype = "user", brks = brks, pch = 3)

## plot crossvalidation residuals
plot(resids, nclasses = 6, inflcol = "_resid.crossv_")




