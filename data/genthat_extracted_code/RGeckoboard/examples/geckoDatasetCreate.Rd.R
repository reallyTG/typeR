library(RGeckoboard)


### Name: geckoDatasetCreate
### Title: Create a Dataset to be used on Geckoboard
### Aliases: geckoDatasetCreate
### Keywords: geckoboard dataset

### ** Examples
## Not run: 
##D data = data.frame(
##D   date=c("2018-03-01", "2018-03-02", "2018-03-03", "2018-03-04"), 
##D 	KPI1=c(77, 78.1, 79, NA), 
##D 	KPI2=c(78, 90, 91.2, 92)
##D )
##D datasetName = "kpi.by_day"
##D types = c("date", "number", "number")
##D geckoDatasetCreate(data, account$apiKey, datasetName, types)
##D geckoDatasetReplace(data, account$apiKey, datasetName, types)
## End(Not run)


