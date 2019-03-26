library(DataVisualizations)


### Name: InspectDistances
### Title: Inspection of Distance-Distribution
### Aliases: InspectDistances
### Keywords: distance Distances InputDistances InspectDistances
###   distribution analysis

### ** Examples

data("Lsun3D")
Data=Lsun3D$Data
## No test: 
InspectDistances(as.matrix(dist(Data)))
## End(No test)
## Don't show: 
InspectDistances(as.matrix(dist(Data[1:50,])))
## End(Don't show)



