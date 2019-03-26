library(EHRtemporalVariability)


### Name: estimateIGTProjection
### Title: Estimates an Information Geometric Temporal plot projection
### Aliases: estimateIGTProjection
###   estimateIGTProjection,IGTProjection-method
###   estimateIGTProjection,DataTemporalMap-method

### ** Examples

load(system.file("extdata",
                 "variabilityDemoNHDSdiagcode1-phewascode.RData",
                  package="EHRtemporalVariability"))
igtProj <- estimateIGTProjection( dataTemporalMap = probMaps$`diagcode1-phewascode`, 
dimensions      = 3, 
startDate       = "2000-01-01", 
endDate         = "2010-12-31")

## Not run: 
##D 
##D # For additional and larger examples download the following .Rdata file:
##D 
##D githubURL <- "https://github.com/hms-dbmi/EHRtemporalVariability-DataExamples/raw/master/variabilityDemoNHDS.RData"
##D load(url(githubURL))
##D igtProj <- estimateIGTProjection( dataTemporalMap = probMaps[[1]], 
##D dimensions      = 3, 
##D startDate       = "2000-01-01", 
##D endDate         = "2010-12-31")
## End(Not run)



