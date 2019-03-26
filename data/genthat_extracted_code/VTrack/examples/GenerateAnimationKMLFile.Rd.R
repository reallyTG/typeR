library(VTrack)


### Name: GenerateAnimationKMLFile
### Title: Create Animation of Transmitter Residences and Movements to View
###   in Google Earth
### Aliases: GenerateAnimationKMLFile
### Keywords: behaviour spatial

### ** Examples


## Not run: 
##D ###GenerateAnimationKMLFile example
##D 
##D # Note, users must download Google Earth in order to visualise the kml.
##D # Extract residence and nonresidence events from the archived crocodile data
##D 
##D # Load crocodile datset into VTrack archive
##D data(crocs)
##D Vcrocs <- ReadInputData(infile=crocs,
##D                         iHoursToAdd=10,
##D                         dateformat = NULL,
##D                         sVemcoFormat='1.0')
##D 
##D # Load Wenlock points file and generate circuitous distance matrix
##D data(PointsCircuitous_crocs)
##D CircuitousDM <- GenerateCircuitousDistance(PointsCircuitous_crocs)
##D 
##D # Extract transmitter #139 data from crocs dataset
##D T139 <- ExtractData(Vcrocs,sQueryTransmitterList = c("139"))
##D 
##D # Extract residence and nonresidence events from the archived crocodile data
##D #   Events occur when >1 detections occurs at a receiver and 
##D #   detections are less than 43200 seconds (12hrs) apart
##D #   The circuitous distance matrix is used for distance calculations
##D T139Res<- RunResidenceExtraction(T139,  
##D                                  "RECEIVERID",    
##D                                  2,              
##D                                  43200,
##D                                  sDistanceMatrix=CircuitousDM)
##D 
##D # The residences event file
##D T139resid <- T139Res$residences
##D # The nonresidences event file
##D T139nonresid <- T139Res$nonresidences
##D 
##D # Set working directory (in this case a temporary directory)
##D setwd(tempdir())
##D 
##D # Write the files to the temporary directory
##D write.csv(T139resid,"T139_resid.csv",row.names=FALSE) 
##D write.csv(T139nonresid,"T139_nonresid.csv",row.names=FALSE) 
##D write.csv(PointsCircuitous_crocs,"PointsCircuitous_crocs.csv",row.names=FALSE) 
##D 
##D # Now generate the .kml animation and save to the temporary directory
##D GenerateAnimationKMLFile("T139_resid.csv","T139_nonresid.csv","PointsCircuitous_crocs.csv",
##D                    "T139.KML","ff0000ff")
##D 
##D # This file can be found within the tempdir() directory on your computer. 
##D # Double-click on the .kml file to open in Google Earth
## End(Not run)



