library(TrackReconstruction)


### Name: DeadReckoning
### Title: Calculates Dead Reckoning
### Aliases: DeadReckoning

### ** Examples

#A simple square example
betas<-Standardize(1,1,1,1,1,1,-1,1,-1,1,-1,1,-1,1,-1,1,-1,1)
data(square)
decinc<-c(0,65)
DRoutput<-DeadReckoning(square,betas,decinc,Hz=1,RmL=2,DepthHz=1,SpdCalc=1)
plot(DRoutput$Ydim,DRoutput$Xdim)

#Standardize tag output
betas<-Standardize(1,1,-1,1,1,1,-57.8,68.76,-61.8,64.2,-70.16,58.08,
-10.1,9.55,-9.75,9.72,-9.91,9.43)
#Declination and inclination data for study area
decinc<-c(10.228,65.918)
#data set with 7 associated GPS fixes in the "gpsdata02" data set
data(rawdata)
DRoutput<-DeadReckoning(rawdata,betas,decinc,Hz=16,RmL=2,DepthHz=1,SpdCalc=3,MaxSpd=3.5)
plot(DRoutput$Ydim,DRoutput$Xdim)



