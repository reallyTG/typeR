library(EpiSignalDetection)


### Name: plotSD
### Title: Plot the Signal Detection time series
### Aliases: plotSD

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

#-- Plotting the signal detection output
plotSD(input = input)




