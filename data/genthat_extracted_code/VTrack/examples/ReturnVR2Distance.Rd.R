library(VTrack)


### Name: ReturnVR2Distance
### Title: Extract the Distances Moved Between VR2 Receiver Units Within
###   the Acoustic Detection Database
### Aliases: ReturnVR2Distance
### Keywords: spatial behaviour

### ** Examples

## Not run: 
##D # Extract residence events at RECEIVERS from the VTrack transformed 
##D #   crocodile dataset
##D 
##D # Load the crocodile dataset into the VTrack archive format
##D data(crocs)  
##D Vcrocs <- ReadInputData(infile=crocs,
##D                         iHoursToAdd=10,
##D                         fAATAMS=FALSE,
##D                         fVemcoDualSensor=FALSE,
##D                         dateformat = NULL,
##D                         sVemcoFormat='1.0')        
##D 
##D # Extract data for only the transmitter #138
##D T138 <- ExtractData(Vcrocs, 
##D                     sQueryTransmitterList = 138)
##D 
##D # Extract residence and non residence events
##D #   Minimum number of detections to register as a residence
##D #   event = 2  
##D #   Min time period between detections before residence event
##D #   recorded = 43200 secs (12 hours)
##D T139Res <- RunResidenceExtraction(sInputFile=T138, 
##D                                  sLocation="RECEIVERID",
##D                                  iResidenceThreshold=2,
##D                                  iTimeThreshold=43200,
##D                                  sDistanceMatrix=NULL)
##D 
##D # The nonresidences event table
##D T139nonresid <- T139Res$nonresidences
##D 
##D # Generate the Direct Distance Matrix
##D data(PointsDirect_crocs)
##D DirectDM <- GenerateDirectDistance(PointsDirect_crocs)
##D 
##D # Run the VR2 distances function
##D (My_distances <- ReturnVR2Distance(NonResidenceFile = T139nonresid,
##D                                    sDistanceMatrix = DirectDM))
## End(Not run) 



