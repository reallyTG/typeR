library(TrackReconstruction)


### Name: Splitter
### Title: Splits large data files by date and time.
### Aliases: Splitter

### ** Examples

#data set with 6 associated GPS fixes in the "gpsdata" data set
data(rawdata)
data(gpsdata02)
Begin=gpsdata02$DateTime[2:6]
End=gpsdata02$DateTime[3:7]
splits<-Splitter(rawdata,Begin,End,RmL=2,Hz=16)
## Not run: 
##D #The following is code to write your many new files
##D setwd() #first fill in the path to the folder where you want the data to be written to
##D for(i in 1:length(splits))
##D {
##D 	num<-i
##D 	num=ifelse(num<10 & length(Begin)>10,paste("0",num,sep=""),num)
##D 		num=ifelse(num<100 & length(Begin)>100,paste("0",num,sep=""),num)
##D 		num=ifelse(num<1000 & length(Begin)>1000,paste("0",num,sep=""),num)
##D 		num=ifelse(num<10000 & length(Begin)>10000,paste("0",num,sep=""),num)
##D 	#Create a name for the file
##D 	Nombre<-paste("Animal01Trip03GPS_Section",num,".txt",sep="")
##D 	write.table(splits[[i]],Nombre,sep="\t",row.names=FALSE,quote=FALSE)
##D 	}
## End(Not run)



