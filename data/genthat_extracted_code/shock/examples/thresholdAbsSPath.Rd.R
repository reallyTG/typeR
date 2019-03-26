library(shock)


### Name: thresholdAbsSPath
### Title: Detect partitions of variables into blocks.
### Aliases: thresholdAbsSPath

### ** Examples


## load data to test 
data(dataTest)

## detect partitions of variables into blocks based on the sample covariance matrix
partitions <- thresholdAbsSPath(dataTest)$partitionList





