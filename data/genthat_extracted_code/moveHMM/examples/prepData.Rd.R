library(moveHMM)


### Name: prepData
### Title: Preprocessing of the tracking data
### Aliases: prepData

### ** Examples

coord1 <- c(1,2,3,4,5,6,7,8,9,10)
coord2 <- c(1,1,1,2,2,2,1,1,1,2)
trackData <- data.frame(coord1=coord1,coord2=coord2)
d <- prepData(trackData,type='UTM',coordNames=c("coord1","coord2"))




