library(SIRItoGTFS)


### Name: STG
### Title: Wrapper function for the SIRItoGTFS library
### Aliases: STG
### Keywords: package spatial

### ** Examples

require(SIRItoGTFS)
require(data.table)
# use the sample SIRI data included with the package
data("sirisample")
SIRIsample$Longitude = as.numeric(SIRIsample$Longitude)
SIRIsample$Latitude = as.numeric(SIRIsample$Latitude)
# load your own GTFS data with `readGTFS()`
# or use the subset of GTFS data conformable to the SIRI sample, also included in the package
data("GTFSstops")
data("GTFSstop_times")
data("GTFScalendar")
data("GTFStrips")
data("GTFSagency")
data("GTFSroutes")
busesDF = STG(SIRIsample,
             GTFSstops. = GTFSstops,
             GTFSagency. = GTFSagency,
             GTFScalendar. = GTFScalendar,
             GTFSroutes. = GTFSroutes,
             GTFSstop_times. = GTFSstop_times,
             GTFStrips. = GTFStrips,
             linerefs = unique(SIRIsample$LineRef[1]))





