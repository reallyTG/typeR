library(RNAsmc)


### Name: getCompare
### Title: Internal function for getting similarity score in a RNA
###   secondary structure
### Aliases: getCompare

### ** Examples

##########
data(DataCluster1)
data(DataCluster2)
data(DataCluster3)
data(DataCluster4)
subStrList <- list(substr1 = getSubStr(DataCluster1),
                   substr2 = getSubStr(DataCluster2),
                   substr3 = getSubStr(DataCluster3),
                   substr4 = getSubStr(DataCluster4))
getCompare(subStrList)



