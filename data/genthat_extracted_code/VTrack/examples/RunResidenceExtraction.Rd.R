library(VTrack)


### Name: RunResidenceExtraction
### Title: Extract Residence and Nonresidence Events Within the Acoustic
###   Detection Database
### Aliases: RunResidenceExtraction
### Keywords: behaviour spatial

### ** Examples


## Not run: 
##D 
##D # Extract residence events from the archived crocodile data
##D 
##D # Load the crocodile dataset into the VTrack archive format
##D data(crocs)
##D Vcrocs <- ReadInputData(infile=crocs,
##D                         iHoursToAdd=10,
##D                         dateformat = NULL,
##D                         sVemcoFormat='1.0')
##D 
##D # Load and generate the direct distance matrix
##D data(PointsDirect_crocs)
##D DirectDM <- GenerateDirectDistance(PointsDirect_crocs)
##D 
##D # Extract data for only transmitter #139
##D T139 <- ExtractData(Vcrocs,sQueryTransmitterList = c("139"))
##D T139_R <- ExtractUniqueValues(T139,5)
##D 
##D # Extract residences and nonresidences events.
##D #   Events occur when >1 detection occurs at a receiver and detections
##D #   are less than 43200 seconds apart
##D #   The direct distance matrix is used for distance calculations
##D T139Res<- RunResidenceExtraction(T139,  
##D                                  "RECEIVERID",    
##D                                  2,              
##D                                  43200,
##D                                  sDistanceMatrix=DirectDM)
##D 
##D # The residenceslog table
##D T139log <- T139Res$residenceslog
##D # The residences event file
##D T139resid <- T139Res$residences
##D # The nonresidences event file
##D T139nonresid <- T139Res$nonresidences
##D 
##D # The RESIDENCEEVENT number in the residences event table corresponds
##D # to the RESIDENCEEVENT number in the residenceslog table
##D subset(T139log,T139log$RESIDENCEEVENT==2)
##D subset(T139resid, T139resid$RESIDENCEEVENT==2)
##D 
##D subset(T139log,T139log$RESIDENCEEVENT==8)
##D subset(T139resid, T139resid$RESIDENCEEVENT==8)
##D 
##D # Scale duration spent at receivers into 4 bins: <1min, <1hr, <1day, >1day  
##D pchDURATION <- ifelse(T139resid$DURATION<60,0.1,
##D                       ifelse(T139resid$DURATION<(60*60),0.5,
##D                              ifelse(T139resid$DURATION<(60*60*24),1,3)))
##D 
##D # For TRANSMITTERID 139 plot the detections against time for each RECEIVERID 
##D par(mfrow=c(1,1),las=1,bty="l")
##D plot(as.Date(T139resid$STARTTIME),
##D      as.numeric(as.factor(
##D        as.numeric(as.character(T139resid$RECEIVERID)))),
##D      ylab="RECEIVERID",xlab="DATETIME",
##D      yaxt="n",pch=1,cex.axis=0.9,cex=pchDURATION,
##D      main=unique(T139resid$TRANSMITTER))
##D axis(side=2,las=1, at=seq(1,length(T139_R),1),cex.axis=0.7,
##D      labels = T139_R[order(as.numeric(T139_R))])     
##D 
##D # Now plot the residence time at a receiver spatially and with 
##D # each point representing the duration spent at each receiver
##D myresid1 <- subset(T139resid, T139resid$ENDREASON=="receiver")
##D totalDur <- tapply(myresid1$DURATION,myresid1$RECEIVERID,sum)
##D totalDurT <- data.frame(LOCATION=names(totalDur), DURATION=as.vector(totalDur))
##D XYDuration <- merge(PointsDirect_crocs,totalDurT)
##D 
##D plot(PointsDirect_crocs$LONGITUDE,PointsDirect_crocs$LATITUDE,
##D      pch=1,cex=0.5,col="grey40",
##D      xlim=c((min(PointsDirect_crocs$LONGITUDE)-0.01),(max(PointsDirect_crocs$LONGITUDE)+0.01)),
##D      ylim=c((min(PointsDirect_crocs$LATITUDE)-0.01),(max(PointsDirect_crocs$LATITUDE)+0.01)),
##D      xlab="Longitude",ylab="Latitude",
##D      main=unique(T139resid$TRANSMITTER))
##D points(XYDuration$LONGITUDE,XYDuration$LATITUDE,
##D        cex=XYDuration$DURATION/500000, pch=16)
## End(Not run)



