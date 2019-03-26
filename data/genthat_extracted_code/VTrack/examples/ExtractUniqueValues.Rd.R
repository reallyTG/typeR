library(VTrack)


### Name: ExtractUniqueValues
### Title: Extract Transmitters Found, or Receivers and Stations Used
### Aliases: ExtractUniqueValues
### Keywords: extract

### ** Examples

data(crocs)
# Load the crocodile data in the VTrack archive format
#  adding 10 hours to convert from UTC 
Vcrocs <- ReadInputData(infile=crocs,
                        iHoursToAdd=10,
                        dateformat = NULL,
                        sVemcoFormat='1.0')

# Extract list of transmitters from the crocs dataset
ExtractUniqueValues(Vcrocs,2)

# Extract list of receivers from the crocs dataset
ExtractUniqueValues(Vcrocs,5)



