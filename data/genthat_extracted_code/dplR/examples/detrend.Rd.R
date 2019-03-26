library(dplR)


### Name: detrend
### Title: Detrend Multiple Ring-Width Series Simultaneously
### Aliases: detrend
### Keywords: manip

### ** Examples
library(utils)
data(ca533)
## Detrend using modified exponential decay. Returns a data.frame
ca533.rwi <- detrend(rwl = ca533, method = "ModNegExp")
## Detrend using a slines on power transformed data and compute
## residuals via subtraction
ca533.rwi <- detrend(rwl = powt(ca533), method = "Spline",
                     difference = TRUE)

## Detrend using modified Hugershoff curve and return info on the model
## fits. Returns a list with: series, curves, modelinfo and data.info
data(co021)
co021.rwi <- detrend(rwl = co021, method = "ModHugershoff",
                     return.info=TRUE)

## Not run: 
##D library(grDevices)
##D ## Detrend using all methods. Returns a list
##D ca533.rwi <- detrend(rwl = ca533)
##D ## Save a pdf of all series
##D fname <- tempfile(fileext=".pdf")
##D print(fname) # tempfile used for output
##D pdf(fname)
##D ca533.rwi <- detrend(rwl = ca533, method = c("Spline", "ModNegExp"),
##D                      make.plot = TRUE)
##D dev.off()
##D 
##D unlink(fname) # remove the file
## End(Not run)



