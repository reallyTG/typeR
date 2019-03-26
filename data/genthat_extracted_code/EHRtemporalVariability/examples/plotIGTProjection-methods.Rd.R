library(EHRtemporalVariability)


### Name: plotIGTProjection
### Title: Information Geometric Temporal plot
### Aliases: plotIGTProjection plotIGTProjection,IGTProjection-method

### ** Examples

load(system.file("extdata",
                 "variabilityDemoNHDSdiagcode1-phewascode.RData",
                  package="EHRtemporalVariability"))

p <- plotIGTProjection( igtProjection   =  igtProjs[[1]],
                        colorPalette    = "Spectral",
                        dimensions      = 2)
p

## Not run: 
##D 
##D # For additional and larger examples download the following .Rdata file:
##D 
##D githubURL <- "https://github.com/hms-dbmi/EHRtemporalVariability-DataExamples/raw/master/variabilityDemoNHDS.RData"
##D load(url(githubURL))
##D plotIGTProjection(igtProjs$`diagcode1-phewascode`, dimensions = 3)
## End(Not run) 



