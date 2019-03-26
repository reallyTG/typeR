library(CorrBin)


### Name: CBData
### Title: Create a 'CBdata' object from a data frame.
### Aliases: CBData
### Keywords: classes manip

### ** Examples

data(shelltox)
sh <- CBData(shelltox, trt="Trt", clustersize="ClusterSize", nresp="NResp")
str(sh)



