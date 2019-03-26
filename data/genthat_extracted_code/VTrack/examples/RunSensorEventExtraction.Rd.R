library(VTrack)


### Name: RunSensorEventExtraction
### Title: Extract Sensor Events within an Acoustic Detection Database
### Aliases: RunSensorEventExtraction
### Keywords: behaviour

### ** Examples

## Not run: 
##D 
##D ## Example 1
##D 
##D # Extract depth events from transmitters attached
##D #   to crocodiles and plot a single diving event
##D 
##D # Load crocodile data
##D data(crocs)  
##D Vcrocs <- ReadInputData(infile=crocs,
##D                         iHoursToAdd=10,
##D                         dateformat = NULL,
##D                         sVemcoFormat='1.0')          
##D 
##D # Extract depth data for only the transmitter #139
##D T139 <- ExtractData(Vcrocs, 
##D                     sQueryTransmitterList = 139)
##D 
##D # Extract increasing depth sensor events
##D #   Start depth event when there is an depth increase of 0.5m within 1 hr 
##D #   Max interval between detections = 1 hr 
##D #   Complete event when sensor returns within 0.5 of the starting value
##D T139dives <- RunSensorEventExtraction(T139,
##D                                     "INCREASE", 
##D                                     "RECEIVERID",
##D                                     "m", 
##D                                     0.5,          
##D                                     (1*60*60),    
##D                                     (60*60),      
##D                                     0.5)          
##D 
##D # The sensor logfile
##D T139divelog <- T139dives$logtable
##D # The sensor event file
##D T139diveevent <- T139dives$event
##D 
##D # Return list of event numbers where sensor events were complete
##D T139diveevent[which(T139diveevent$ENDREASON=="return"),"SENSOREVENT"]
##D 
##D # Now extract and plot a single sensor event (we have swapped the axes round 
##D #   to show the diving behaviour)
##D mylog <- subset(T139divelog,T139divelog$SENSOREVENT==19)
##D par(mfrow=c(1,1),las=1,bty="l")
##D plot(mylog$DATETIME,(mylog$SENSOR1),
##D      xlab="Event duration (mins)",ylab="Depth (m)",type="b",
##D      yaxs = "i", xaxs = "i", ylim = rev(c(0,max(mylog$SENSOR1+0.5))),
##D      xlim = (range(mylog$DATETIME)+(c(-60,30))),
##D      pch=as.character(mylog$RECORD))
##D title(main=paste("Id=",mylog[1,4],", event=",mylog[1,2], sep=" "))
##D 
##D ######################################################
##D 
## End(Not run)



