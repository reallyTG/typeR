library(VTrack)


### Name: ExtractRecSummary
### Title: Extended Function to Extract Summary Data for each Receiver
###   Serial Number in the File
### Aliases: ExtractRecSummary
### Keywords: spatial

### ** Examples

data(crocs)
# Load the crocodile data in the VTrack archive format
#  adding 10 hours to convert from UTC 
Vcrocs <- ReadInputData(infile=crocs,
                        iHoursToAdd=10,
                        dateformat = NULL,
                        sVemcoFormat='1.0')

# Extract summary table of receivers in the file
ExtractRecSummary(Vcrocs)



