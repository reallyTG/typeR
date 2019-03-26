library(blackbox)


### Name: prepareData
### Title: Prepare data and controls for smoothing
### Aliases: prepareData

### ** Examples

require(spaMM)
data(blackcap) ## use dataset as template
sorted_etc <- prepareData(data=blackcap,ParameterNames=c("longitude", "latitude"),
                    respName="means")



