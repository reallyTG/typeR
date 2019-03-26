library(VTrack)


### Name: RunTimeProfile
### Title: Extract a Time Profile for Depth, Temperature, Residence or
###   Non-residence Events
### Aliases: RunTimeProfile
### Keywords: behaviour

### ** Examples


## Not run: 
##D # RunTimeProfile example using residences, nonresidences and sensor events
##D   
##D # Load crocodile data and convert to a VTrack archive format 
##D data(crocs)
##D Vcrocs <- ReadInputData(infile=crocs,
##D                         iHoursToAdd=10,
##D                         dateformat = NULL,
##D                         sVemcoFormat='1.0')
##D 
##D # Load receiver data and generate the circuitous distance matrix 
##D data(PointsCircuitous_crocs)
##D CircuitousDM <- GenerateCircuitousDistance(PointsCircuitous_crocs)
##D   
##D # Extract depth data for transmitter #139
##D T139 <- ExtractData(Vcrocs,sQueryTransmitterList = c("139"))
##D T139_R <- ExtractUniqueValues(T139,5)
##D   
##D # Extract residence and non residence events
##D T139Res<- RunResidenceExtraction(T139,
##D                                  "RECEIVERID",
##D                                  2,
##D                                  43200,
##D                                  sDistanceMatrix=CircuitousDM)
##D # The residences event table
##D T139resid <- T139Res$residences
##D # The nonresidences event table
##D T139nonresid <- T139Res$nonresidences
##D 
##D # Generate plot dimentions
##D par(mfrow=c(2,2),las=1,bty="l")
##D   
##D ## Plot a 
##D # RESIDENCES: duration/day
##D Vres_D <- RunTimeProfile(T139resid,"STARTTIME","day")
##D day_res <- tapply(Vres_D$TIMEMAX,Vres_D$DATETIME,sum)[1:25]/(60*60)
##D numnames <- as.Date(as.character(names(day_res)))
##D plot(as.vector(day_res)~numnames,pch=16,
##D      xlab="Day",ylab="Duration (h)",main="",ylim=c(0,23))
##D   
##D ## Plot b
##D # MOVEMENTS: distance/month
##D 
##D Vmove_M <- RunTimeProfile(T139nonresid,"STARTTIME","month")
##D mon_mov <- tapply(Vmove_M$DISTANCE,Vmove_M$DATETIME,mean)/1000
##D numnames <- as.numeric(as.character(names(mon_mov)))
##D movdata <- rep(0,12)
##D movdata[numnames] <- as.vector(mon_mov)
##D names(movdata)<-as.character(1:12)
##D plot(as.vector(movdata)[9:12]~ names(movdata)[9:12],pch=16,xaxt="n",
##D      xlab="Month",ylab="Min distance (km)",main="")
##D axis(side=1,las=1, at=seq(9,12),labels=month.name[9:12])
##D 
##D ## Plot c  
##D # DEPTH EVENTS: frequency/diel cycle
##D 
##D # Extract increasing depth sensor events for transmitter 139
##D T139dives <- RunSensorEventExtraction(T139,
##D                                       "INCREASE",
##D                                       "RECEIVERID",
##D                                       "m",
##D                                       0.5,
##D                                       (1*60*60),
##D                                       (60*60),
##D                                       0.5)
##D # The sensor logtable
##D T139divelog <- T139dives$logtable
##D # The sensor event file
##D T139diveevent <- T139dives$event
##D # Remove timeout events
##D T139diveevent<-subset(T139diveevent,T139diveevent$ENDREASON=="return")
##D   
##D Vdiv_C <- RunTimeProfile(T139diveevent,"STARTTIME","circadian")
##D cir_div <- tapply(Vdiv_C$FREQ,Vdiv_C$DATETIME,mean)
##D numnames <- as.numeric(as.character(names(cir_div)))
##D divdata <- rep(0,24)
##D divdata[numnames+1] <- as.vector(cir_div)
##D names(divdata)<-as.character(0:23)
##D plot(as.vector(divdata)~ names(divdata),pch=16,
##D      xlab="24 hr cycle",ylab="Number of depth events",main="")
##D   
## End(Not run)



