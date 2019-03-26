library(AFM)


### Name: getNetworkParameters
### Title: Get Network parameters
### Aliases: getNetworkParameters
###   getNetworkParameters,AFMImageNetworksAnalysis-method
###   getNetworkParameters,AFMImage-method

### ** Examples

## Not run: 
##D library(AFM)
##D library(parallel)
##D 
##D # dir = ""
##D # filename= ""
##D AFMImage<-importFromNanoscope(paste0(dir,filename))
##D AFMImageNetworksAnalysis = new("AFMImageNetworksAnalysis")
##D AFMImageNetworksAnalysis@heightNetworksslider=10
##D AFMImageNetworksAnalysis@filterNetworkssliderMin=150
##D AFMImageNetworksAnalysis@filterNetworkssliderMax=300
##D AFMImageNetworksAnalysis@smallBranchesTreatment=TRUE
##D AFMImageNetworksAnalysis<-transformAFMImageForNetworkAnalysis(AFMImageNetworksAnalysis, AFMImage)
##D numWorkers <- parallel::detectCores()
##D cl <- makeCluster(numWorkers,outfile="")
##D AFMImageNetworksAnalysis<-identifyNodesWithCircles(cl=cl, 
##D     AFMImageNetworksAnalysis= AFMImageNetworksAnalysis)
##D AFMImageNetworksAnalysis<-identifyEdgesFromCircles(cl=cl,
##D     AFMImageNetworksAnalysis= AFMImageNetworksAnalysis,
##D     MAX_DISTANCE = 40)
##D AFMImageNetworksAnalysis<-identifyIsolatedNodes(AFMImageNetworksAnalysis)
##D AFMImageNetworksAnalysis<-createGraph(AFMImageNetworksAnalysis, fusioned=FALSE)
##D AFMImageNetworksAnalysis<-calculateShortestPaths(cl=cl,
##D     AFMImageNetworksAnalysis= AFMImageNetworksAnalysis)
##D stopCluster(cl)
##D networkParameters<-getNetworkParameters(AFMImageNetworksAnalysis, AFMImage)
##D print(networkParameters)
## End(Not run)



