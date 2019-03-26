library(SSN)


### Name: EmpiricalSemivariogram
### Title: Empirical Semivariogram Based on Euclidean Distance
### Aliases: EmpiricalSemivariogram

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
    
# Compute the empirical semivariogram for the raw data. 
# the number of pairs used to estimate the semivariance
EVout <- EmpiricalSemivariogram(mf04, "Summer_mn", directions = 0, tolerance = 180,
    nlag = 10)
# Plot it and set the point size relative to the number of pairs used to estimate
# the semivariance
plot(EVout$distance, EVout$gamma, pch = 19, cex = EVout$np/100, ylim = c(0,6),
    ylab = "Gamma", xlab = "Distance", col = "blue", 
    main = "Empirical Semivariogram - Raw Data")

# generate and plot an empirical semivariogram based on model residuals
data(modelFits)
#for examples only, make sure fitSP has the correct path
#if you use importSSN(), path will be correct
fitSp$ssn.object <- updatePath(fitSp$ssn.object, 
	paste0(tempdir(),'/MiddleFork04.ssn'))

fitSpRes <- residuals(fitSp)
names(getSSNdata.frame(fitSpRes))
EVresid <- EmpiricalSemivariogram(fitSpRes, "_resid_", directions = 0, 
    tolerance = 180, nlag = 7,	maxlag = 15000,)
plot(EVresid$distance, EVresid$gamma, pch = 19, cex = EVresid$np/50, ylim = c(0,6),
    ylab = "Gamma", xlab = "Distance", main = "Empirical Semivariogram - Residuals")




