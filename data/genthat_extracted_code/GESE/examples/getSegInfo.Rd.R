library(GESE)


### Name: getSegInfo
### Title: Computes segregation information for different mode of
###   inheritance.
### Aliases: getSegInfo
### Keywords: probability

### ** Examples

data(pednew)
data(mapInfo)
data(dataRaw)
data(database)
result <- getSegInfo(pednew, dataRaw, mapInfo)
result$varSeg
result$geneSeg

result <- getSegInfo(pednew, dataRaw, mapInfo, mode="recessive")
result$varSeg
result$geneSeg

result <- getSegInfo(pednew, dataRaw, mapInfo, mode="CH")
result$varSeg
result$geneSeg
result$genePairSeg





