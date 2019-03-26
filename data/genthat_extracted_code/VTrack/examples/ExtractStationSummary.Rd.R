library(VTrack)


### Name: ExtractStationSummary
### Title: Extended Function to Extract Summary Data for each Station Name
###   in the File
### Aliases: ExtractStationSummary
### Keywords: spatial

### ** Examples

data(crocs)
# Load the crocodile data in the VTrack archive format
#  adding 10 hours to convert from UTC 
Vcrocs <- ReadInputData(infile=crocs,
                        iHoursToAdd=10,
                        dateformat = NULL,
                        sVemcoFormat='1.0')

# Extract summary table of receiver sstations in the file
ExtractStationSummary(Vcrocs)



