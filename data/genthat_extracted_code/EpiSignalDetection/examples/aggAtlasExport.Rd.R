library(EpiSignalDetection)


### Name: aggAtlasExport
### Title: Aggregate filtered final Atlas export
### Aliases: aggAtlasExport

### ** Examples

#-- Setting the parameters to run the report for
input <- list(
disease = "Salmonellosis",
country = "EU-EEA - complete series",
indicator = "Reported cases",
stratification = "Confirmed cases",
unit = "Month",
daterange = c("2010-01-01", "2016-12-31"),
algo = "FarringtonFlexible",
testingperiod = 5
)

#-- Example dataset
dataset <- EpiSignalDetection::SignalData

#-- Filtering on declared input parameters
dataset <- filterAtlasExport(dataset, input)

#-- Aggregating the data by geographical level and time point
dataset <- aggAtlasExport(dataset, input)




