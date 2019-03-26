library(netSEM)


### Name: pathwayPredict
### Title: Summary of predicted and observed response values along a
###   pathway
### Aliases: pathwayPredict

### ** Examples

# Load the sample acrylic data set
data(acrylic)
ans <- netSEMm(acrylic)
paths <- pathwayRMSE(ans,maxlen=3)
response <- pathwayPredict(ans, paths[10,2])
response




