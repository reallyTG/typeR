library(EHRtemporalVariability)


### Name: plotDataTemporalMap
### Title: Data Temporal heatmap
### Aliases: plotDataTemporalMap plotDataTemporalMap,DataTemporalMap-method

### ** Examples

load(system.file("extdata",
                 "variabilityDemoNHDSdiagcode1-phewascode.RData",
                  package="EHRtemporalVariability"))

p <- plotDataTemporalMap(dataTemporalMap =  probMaps[[1]],
                    colorPalette    = "Spectral",
                    startValue = 2,
                    endValue = 40)
p

## Not run: 
##D 
##D # For additional and larger examples download the following .Rdata file:
##D 
##D githubURL <- "https://github.com/hms-dbmi/EHRtemporalVariability-DataExamples/raw/master/variabilityDemoNHDS.RData"
##D load(url(githubURL))
##D plotDataTemporalMap(probMaps$`diagcode1-phewascode`, startValue = 2, endValue = 40)
## End(Not run)



