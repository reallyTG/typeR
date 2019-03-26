library(MigClim)


### Name: MigClim.migrate
### Title: Initialize and run the MigClim simulation
### Aliases: MigClim.migrate

### ** Examples

  
  data(MigClim.testData)

  ### Run MigClim with a data frame type input.
  n<-MigClim.migrate (iniDist=MigClim.testData[,1:3],
     hsMap=MigClim.testData[,4:8], rcThreshold=500, 
     envChgSteps=5, dispSteps=5, dispKernel=c(1.0,0.4,0.16,0.06,0.03),
     barrier=MigClim.testData[,9], barrierType="strong", 
     iniMatAge=1, propaguleProd=c(0.01,0.08,0.5,0.92),
     lddFreq=0.1, lddMinDist=6, lddMaxDist=15, 
     simulName="MigClimTest", replicateNb=1, overWrite=TRUE, 
     testMode=FALSE, fullOutput=FALSE, keepTempFiles=FALSE)
  
## Not run: 
##D   ### Convert data from a dataframe to ASCII grid format
##D   library(SDMTools)
##D   dataframe2asc(MigClim.testData[,c(2,1,3:9)])
##D   ### and then run MigClim with "raster" type input.
##D   n<-MigClim.migrate (iniDist="InitialDist",
##D      hsMap="HSmap", rcThreshold=500, 
##D      envChgSteps=5, dispSteps=5, dispKernel=c(1.0,0.4,0.16,0.06,0.03), 
##D      barrier="Barrier", barrierType="strong", 
##D      iniMatAge=1, propaguleProd=c(0.01,0.08,0.5,0.92), 
##D      lddFreq=0.1, lddMinDist=6, lddMaxDist=15, 
##D      simulName="MigClimTest", replicateNb=1, overWrite=TRUE, 
##D      testMode=FALSE, fullOutput=FALSE, keepTempFiles=FALSE)
## End(Not run)


