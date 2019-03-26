library(fitODBOD)


### Name: BODextract
### Title: Binomial Data Extraction from Raw data
### Aliases: BODextract

### ** Examples

datapoints=sample(0:10,340,replace=TRUE) #creating a sample set of observations
BODextract(datapoints)                   #extracting binomial outcome data from observations
Random.variable=BODextract(datapoints)$RV #extracting the binomial random variables




