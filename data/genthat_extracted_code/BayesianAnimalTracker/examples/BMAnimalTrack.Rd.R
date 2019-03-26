library(BayesianAnimalTracker)


### Name: BMAnimalTrack
### Title: Bayesian melding bias correction and uncertainty
###   characterization of DR path with GPS observations.
### Aliases: BMAnimalTrack
### Keywords: Bias Correction

### ** Examples

set.seed(1)
#Generating data from our model
dlist <- dataSim(T=100, K=10, s2H=1, s2D=0.1, betaVec=c(1))
gpsObs <- dlist$Y
gpsTime <- dlist$Ytime
drPath <- dlist$X
#Produce the data list required by BMAnimalTrack
wlist <- as.dataList(drPath, gpsObs, gpsTime, 
            timeUnit=1, s2G=0.01, dUnit=1, betaOrder=1)
#Calculate the posterior of eta with our Bayesian Melding approach
etaMar <- BMAnimalTrack(wlist, BMControl(print=TRUE))

## Not run: 
##D ## A real data example from package TrackReconstruction.
##D ## Example from TrackReconstruction package.
##D ## library(TrackReconstruction)
##D betas<-Standardize(1,1,-1,1,1,1,-57.8,68.76,-61.8,64.2,
##D     -70.16,58.08, -10.1,9.55,-9.75,9.72, -9.91,9.43)
##D #get declination and inclination data for study area
##D decinc<-c(10.228,65.918)
##D #data set with 6 associated GPS fixes in the "gpsdata" data set
##D data(rawdata)
##D #Perform the Dead-Reckoning of the raw accelerometer and 
##D # magnetometer data
##D DRoutput<-DeadReckoning(rawdata,betas,decinc,Hz=16,
##D             RmL=2,DepthHz=1,SpdCalc=3,MaxSpd=3.5)
##D #prepare GPS data
##D data(gpsdata02)
##D #matching time of the GPS and DR
##D gpsdata <- gpsdata02[gpsdata02$DateTime %in% DRoutput$DateTime, ]
##D gpsformat<-GPStable(gpsdata)
##D K <- nrow(gpsformat)
##D T <- nrow(gpsformat)
##D #Cut out the periods of DR path with the GPS
##D DRstart <- min(which(DRoutput$DateTime==gpsformat$DateTime[1]))
##D DRend <- max(which(DRoutput$DateTime==gpsformat$DateTime[K]))
##D #Thin the data (Original 16Hz, for now only working with 1Hz)
##D DRworking <- DRoutput[c(DRstart:DRend)[c(DRstart:DRend)%%16==1], ]
##D 
##D #Calculate the northing in km##
##D GPSnorthing=c(0, cumsum(gpsformat$DistanceKm[-1]*cos(gpsformat$BearingRad[-T])))
##D DRnorthing <- (DRworking$Ydim - DRworking$Ydim[1])/1000 
##D #Original unit of DR is in meters
##D 
##D #Data preparation for BM bias correction
##D ndl <- as.dataList(DRnorthing, GPSnorthing, 
##D     Ytime=gpsformat$DateTime, 
##D     Xtime=DRworking$DateTime, 
##D     s2G=0.0625, timeUnit=60, betaOrder=1)
##D #Bayesian Melding calculation.
##D nEtaMar <- BMAnimalTrack(ndl, BMControl(print=TRUE, returnParam=TRUE))
##D 		
##D #Plots.
##D plot(ndl$XMx[,2], ndl$XMx[,1], type="l", col="blue", ylim=c(0, 2.5)) 
##D #uncorrected DR path
##D points(ndl$glist$Gtime, ndl$glist$Y, col="red", pch=16) #GPS points
##D lines(ndl$XMx[,2], nEtaMar$etaMar[,1], type="l") #Corrected path
##D lines(ndl$XMx[,2], nEtaMar$etaMar[,3], type="l", col="grey70") #Lower bound of CI
##D lines(ndl$XMx[,2], nEtaMar$etaMar[,4], type="l", col="grey70") #Upper bound of CI.
## End(Not run)



