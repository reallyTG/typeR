library(SSN)


### Name: plot.Torgegram
### Title: Plotting Method for Torgegram Objects
### Aliases: plot.Torgegram

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

# generate and plot an empirical semivariogram based on model residuals
data(modelFits)
#make sure fitSp has the correct path, will vary for each users installation
fitSp$ssn.object@path <- system.file("lsndata/MiddleFork04.ssn", package = "SSN")
resids <- residuals(fitSp)
names(resids$ssn.object)
ESVF <- Torgegram(resids, "_resid_", maxlag = 20000,
    nlag = 10)
plot(ESVF, xlim = c(0,10000))




