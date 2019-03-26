library(WiSEBoot)


### Name: WiSEBoot-package
### Title: Wild Scale-Enhanced (WiSE) Bootstrap
### Aliases: WiSEBoot-package
### Keywords: package

### ** Examples

##User should implement a high number of bootstrap samples (R).  
##  R=10 bootstrap samples is not recommended.  For demonstration only.

##Select a wavelet smooth level for signal
data("SimulatedSNR9Series")
bootObj <- WiSEBoot(SimulatedSNR9Series[,4], R=10)
bootObj$MSECriteria #check WiSEBoot selected threshold (minimum MSE) -- truth is J0=3

##Test whether \alpha=0 and \beta=1 for AIRS and IPSL Run 1 at 60E
data("CM20N20S60E")
padData <- padMatrix(CM20N20S60E)
hypTest <- WiSEHypothesisTest(padData$xPad[,1], padData$xPad[,2], J0=5, R=10, 
                              XParam=padData$linearParam[,1], YParam=padData$linearParam[,2], 
                              plot=TRUE)



