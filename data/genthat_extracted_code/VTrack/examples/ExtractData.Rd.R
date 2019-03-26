library(VTrack)


### Name: ExtractData
### Title: Filter a Subset of Data from a VTrack File
### Aliases: ExtractData
### Keywords: archive extract

### ** Examples

# Load the crocodile data set
data(crocs)

# Convert data into the VTrack archive format
Vcrocs <- ReadInputData(infile=crocs,
                        iHoursToAdd=10,
                        dateformat = NULL,
                        sVemcoFormat='1.0')

# Extract list of transmitters from test archive 1
(TransmitterList <- ExtractUniqueValues(Vcrocs,2))  

# Plot the detections against time for each TRANSMITTERID
par(mfrow=c(1,1),las=1,bty="l")
plot(as.Date(Vcrocs$DATETIME), as.numeric(as.factor(as.numeric(as.character(
	Vcrocs$TRANSMITTERID)))),
     ylab="TRANSMITTERID",xlab="DATETIME",
     yaxt="n",pch=16,cex=0.7)
axis(side=2, at=seq(1,length(TransmitterList),1),
     labels = TransmitterList[order(as.numeric(
	TransmitterList))])

# For TRANSMITTERID 139 plot the detections against time for each RECEIVERID 
par(mfrow=c(1,1),las=1,bty="l")
T139 <- ExtractData(Vcrocs,sQueryTransmitterList = c("139"))

# Extract data from TRANSMITTERID 139 and plot raw sensor data
par(mfrow=c(1,1),las=1,bty="l")
plot(T139$SENSOR1~
	T139$DATETIME,xlab="Date",
	ylab="Depth (m)",main=unique(T139[,2]),
	pch=16,cex=0.7)

# Extract depth only data for a certain time period.
#Vcrocs_Depth <- ExtractData(Vcrocs,
#	sQueryDataType = "m",
#	sQuerySTARTTIME = "2008-08-01 21:00:00",
#	sQueryENDTIME = "2009-10-31 23:03:00")  




