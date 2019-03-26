library(VTrack)


### Name: GenerateAnimationKMLFile_Track
### Title: Create Animation of Transmitter Track to View in Google Earth
### Aliases: GenerateAnimationKMLFile_Track
### Keywords: behaviour spatial

### ** Examples


## Not run: 
##D ###GenerateAnimationKMLFile_Track example
##D 
##D # Note, users must download Google Earth in order to visualise the kml
##D 
##D # Load crocodile datset into VTrack archive
##D data(crocs)
##D Vcrocs <- ReadInputData(infile=crocs,
##D                         iHoursToAdd=10,
##D                         dateformat = NULL,
##D                         sVemcoFormat='1.0')
##D 
##D # Load Wenlock points file
##D data(PointsDirect_crocs)
##D 
##D # Set working directory (in this case a temporary directory)
##D setwd(tempdir())
##D # or alternatively to your Desktop on Mac OS
##D # setwd("~/Desktop")
##D 
##D (TransmitterList <- ExtractUniqueValues(Vcrocs,2)) # Extract the transmitter names
##D TransmitterList[1] # Let's create the track for this tag
##D 
##D # Run the function to generate the KML for a single transmitter
##D GenerateAnimationKMLFile_Track(Vcrocs, # VTrack archive file
##D                                TransmitterList[1], # Transmitter id
##D                                PointsDirect_crocs, # points file
##D                                "Track1.kml", # file name
##D                                "cc69deb3", # colour of the track
##D                                sLocation="RECEIVERID")
##D 
##D # This file can be found within the tempdir() directory on your computer. 
##D # Double-click on the .kml file to open in Google Earth
## End(Not run)



