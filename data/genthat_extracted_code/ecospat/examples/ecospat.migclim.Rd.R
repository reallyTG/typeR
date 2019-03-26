library(ecospat)


### Name: ecospat.migclim
### Title: Implementing Dispersal Into Species Distribution Models
### Aliases: ecospat.migclim

### ** Examples

## Not run: 
##D ecospat.migclim()
##D ### Some example data files can be downloaded from the following web page:
##D ### http://www.unil.ch/ecospat/page89413.html
##D ###
##D ### Run the example as follows (set the current working directory to the
##D ### folder where the example data files are located):
##D ###
##D library(MigClim)
##D data(MigClim.testData)
##D ### Run MigClim with a data frame type input.
##D n <- MigClim.migrate (iniDist=MigClim.testData[,1:3],
##D hsMap=MigClim.testData[,4:8], rcThreshold=500,
##D envChgSteps=5, dispSteps=5, dispKernel=c(1.0,0.4,0.16,0.06,0.03),
##D barrier=MigClim.testData[,9], barrierType="strong",
##D iniMatAge=1, propaguleProd=c(0.01,0.08,0.5,0.92),
##D lddFreq=0.1, lddMinDist=6, lddMaxDist=15,
##D simulName="MigClimTest", replicateNb=1, overWrite=TRUE,
##D testMode=FALSE, fullOutput=FALSE, keepTempFiles=FALSE)
## End(Not run)



