library(AFM)


### Name: getLogLogOmnidirectionalSlopeGraph
### Title: Get the graph of the Log Log omnidiretction variogram
###   'getLogLogOmnidirectionalSlopeGraph' returns Get the graph of the Log
###   Log omnidirectional variogram
### Aliases: getLogLogOmnidirectionalSlopeGraph

### ** Examples

## Not run: 
##D library(AFM)
##D library(ggplot2)
##D 
##D data(AFMImageOfRegularPeaks)
##D 
##D AFMImageAnalyser = new("AFMImageAnalyser",
##D          fullfilename="/home/ubuntu/AFMImageOfRegularPeaks-Analyser.txt")
##D variogramAnalysis<-AFMImageVariogramAnalysis(sampleFitPercentage=3.43/100)
##D AFMImageAnalyser@variogramAnalysis<-variogramAnalysis
##D AFMImageAnalyser@variogramAnalysis@omnidirectionalVariogram<-
##D      calculateOmnidirectionalVariogram(AFMImage= AFMImageOfRegularPeaks, 
##D                                        AFMImageVariogramAnalysis= variogramAnalysis)
##D p<-getLogLogOmnidirectionalSlopeGraph(AFMImageAnalyser,  withFratcalSlope=TRUE)
##D p
## End(Not run) 



