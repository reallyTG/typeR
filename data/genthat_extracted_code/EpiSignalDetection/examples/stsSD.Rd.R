library(EpiSignalDetection)


### Name: stsSD
### Title: Build sts object
### Aliases: stsSD

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

#-- Bulding the corresponding sts object
dataset.sts <- stsSD(observedCases = dataset$NumValue,
                     studyPeriod = dataset$StudyPeriod,
                     timeUnit = input$unit,
                     startYM = c(as.numeric(format(as.Date(input$daterange[1], "%Y-%m-%d"), "%Y")),
                                 as.numeric(format(as.Date(input$daterange[1], "%Y-%m-%d"), "%m"))))




