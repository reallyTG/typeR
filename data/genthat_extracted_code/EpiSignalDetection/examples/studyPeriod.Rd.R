library(EpiSignalDetection)


### Name: studyPeriod
### Title: Compute the study period
### Aliases: studyPeriod

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

StudyPeriod <- studyPeriod(input)
head(StudyPeriod)




