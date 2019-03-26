library(VTrack)


### Name: ExtractTagSummary
### Title: Function to Extract Summary Data for each Transmitter in the
###   File
### Aliases: ExtractTagSummary
### Keywords: spatial

### ** Examples

# Load the crocodile data in the VTrack 1.0 archive format
#  adding 10 hours to convert from UTC 
data(crocs)
Vcrocs <- ReadInputData(infile=crocs,
                        iHoursToAdd=10,
                        dateformat = NULL,
                        sVemcoFormat='1.0')

# Extract summary table of transmitters in the file according to receiver serial numbers 
ExtractTagSummary(Vcrocs,sLocation="RECEIVERID")

# Extract summary table of transmitters in the file according to station names 
ExtractTagSummary(Vcrocs,sLocation="STATIONNAME")



