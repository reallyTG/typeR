library(GeoRange)


### Name: MSTDist_FromMat
### Title: Calculates the minimum spanning tree distance, in kilometers,
###   using Prim's Algorithm [1] and a previously calculated pairwsie
###   distance matrix
### Aliases: MSTDist_FromMat

### ** Examples

MSTCalc<-MSTDist(longs=c(22,44,-12,67),lats=c(-77,56,22,56))
MSTDist_FromMat(MSTCalc$Longitude,MSTCalc$Latitude,MSTCalc$MST_DistMat)



