library(EHRtemporalVariability)


### Name: trimDataTemporalMap
### Title: Trims a 'DataTemporalMap'
### Aliases: trimDataTemporalMap trimDataTemporalMap,DataTemporalMap-method

### ** Examples

load(system.file("extdata",
                 "variabilityDemoNHDSdiagcode1-phewascode.RData",
                  package="EHRtemporalVariability"))

probMapTrimmed <- trimDataTemporalMap( 
                         dataTemporalMap = probMaps[[1]],
                         startDate       = "2005-01-01",
                         endDate         = "2008-12-01"
)



