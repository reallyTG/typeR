library(RFmarkerDetector)


### Name: mds
### Title: mds class
### Aliases: mds

### ** Examples

data(cachexiaData)
params = list(ntree = 1000, mtry = round(sqrt(ncol(cachexiaData) -2)), seed = 1234)
mds_obj <- mds(cachexiaData, opt = params)



