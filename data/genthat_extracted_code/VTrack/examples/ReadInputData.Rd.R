library(VTrack)


### Name: ReadInputData
### Title: Read in a Raw VEMCO or AATAMS Data File into a VTrack Archive
### Aliases: ReadInputData
### Keywords: archive

### ** Examples

# Load the crocodile dataset
data(crocs)  

# Convert data into the VTrack archive format 
Vcrocs <- ReadInputData(infile=crocs,
                        iHoursToAdd=10,
                        fIMOSATF=FALSE,
                        fVemcoDualSensor=FALSE,
                        dateformat=NULL,
                        sVemcoFormat='1.0')

# Plot a frequency histogram of total detection per transmitter
NoDetect_ID <- tapply(rep(1,nrow(Vcrocs)),
                      Vcrocs$TRANSMITTERID,sum)
par(mfrow=c(1,1),las=1,bty="l")  
bp <- barplot(height=NoDetect_ID,
              ylab="Number of detections",xlab="Transmitter ID",
              axes=FALSE,axisnames=FALSE)        
labels <- names(NoDetect_ID)
text(bp, par("usr")[3],labels=labels, 
     srt=45,adj=c(1.1,1.1),xpd=TRUE,cex=0.8)
axis(2)
  
# Plot a frequency histogram of total detection per receiver
NoDetect_REC <- tapply(rep(1,nrow(Vcrocs)),Vcrocs$RECEIVERID,sum) 
bp <- barplot(height=NoDetect_REC,
              ylab="Number of detections",xlab="Receiver ID",
              axes=FALSE, axisnames=FALSE)
labels <- names(NoDetect_REC)
text(bp, par("usr")[3], labels=labels, 
     srt = 45, adj=c(1.1,1.1),xpd=TRUE,cex=0.8)
axis(2)
  
# Plot a frequency histogram of total detections over time
NoDetect_DAY <- tapply(rep(1,nrow(Vcrocs)),
                       as.Date(Vcrocs$DATETIME),sum) 
barplot(height=NoDetect_DAY,
        names.arg=names(NoDetect_DAY),
        ylab="Number of detections",
        xlab="Date")



