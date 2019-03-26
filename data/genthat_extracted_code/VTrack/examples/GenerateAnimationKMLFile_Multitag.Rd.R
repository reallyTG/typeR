library(VTrack)


### Name: GenerateAnimationKMLFile_Multitag
### Title: Create Animation of Multiple Transmitters to View in Google
###   Earth
### Aliases: GenerateAnimationKMLFile_Multitag
### Keywords: behaviour spatial

### ** Examples

  
  ## Not run: 
##D     ###GenerateAnimationKMLFile_Multitag example
##D     
##D     # Note, users must download Google Earth in order to visualise the kml.
##D     
##D     # Load crocodile datset into VTrack archive
##D     data(crocs)
##D     data(PointsDirect_crocs)
##D     
##D     Vcrocs <- ReadInputData(infile=crocs,
##D                             iHoursToAdd=10,
##D                             dateformat = NULL,
##D                             sVemcoFormat='1.0')
##D     
##D     # Set working directory (in this case a temporary directory)
##D     setwd(tempdir())
##D     # or alternatively to your Desktop on Mac OS
##D     # setwd("~/Desktop")
##D     
##D     # Run the function to generate the KML
##D     GenerateAnimationKMLFile_Multitag(Vcrocs,
##D                                       PointsDirect_crocs,
##D                                       "Croc Multi.kml",
##D                                       sLocation="RECEIVERID")
##D                                       
##D     # This file can be found within the tempdir() directory on your computer. 
##D     # Double-click on the .kml file to open in Google Earth
## End(Not run)



