library(BayesianAnimalTracker)


### Name: Trip1
### Title: GPS observation and DR path from a foraging trip of northern fur
###   seal
### Aliases: Trip1GPS Trip1DR Trip1
### Keywords: datasets

### ** Examples

data(Trip1GPS)
data(Trip1DR)
###Bayesian Melding correction of DR path for this data set.
## Not run: 
##D ###Additional File for Animal Bio-telemetry
##D ###Working with a thinned version of Trip 1 data set.
##D #First install our R package
##D install.packages("BayesianAnimalTracker")
##D 
##D #Load the package
##D library(BayesianAnimalTracker)
##D #Require version 1.1 or higher.
##D 
##D ##Load the uncorrected DR path
##D data(Trip1DR) 
##D   #this result is produced by the TrackReconstruction package
##D 
##D ##Load the GPS observations
##D data(Trip1GPS) 
##D 
##D ##Processng the GPS observations to get northing and easting in KM
##D Trip1GPSformat <- GPStable(Trip1GPS)
##D 	#GPStable is from TrackReconstruction
##D Trip1GPSinKM <- DegToKM(Trip1GPSformat)
##D 	#Get the northing and easting in km
##D 
##D ###Analyze the Northing direction
##D ##Prepare the data list that will be used in our Baysian Melding
##D ndl <- as.dataList(Trip1DR$Ydim/1000, Trip1GPSinKM$Northing, 
##D                    Ytime=strptime(Trip1GPS$DateTime, "%d-%b-%Y %H:%M:%S"), 
##D                    Xtime=strptime(Trip1DR$DateTime, "%d-%b-%Y %H:%M:%S"), 
##D                    s2G=0.0625, timeUnit=60, betaOrder=1)
##D 	#Please notice that the DR is in meter.
##D 	#Need to convert it into kilometer.
##D 	#Notice here the Xtime is not regularly spaced.
##D 	#It must be converted to the dateTime format
##D 	#Before further operations.
##D ##The Bayesian Melding to correct bias and qualify uncertianty	
##D nPost <- BMAnimalTrack(ndl, BMControl(print=TRUE, returnParam=TRUE))
##D 	#nPost is a list with two components
##D 	#first is the parameter estimates of sigma^2_D and sigma^2_H
##D 	#second is a matrix of the posterior mean and variance of eta. 
##D 	#If only eta is needed, you can chagne returnParam into FALSE.
##D 
##D ##Plot the results in Easting direction.
##D ##Produce Figure 4 in our paper	
##D nYlim <- c(min(min(ndl$XMx[, 1]),min(nPost$etaMar[,1])),  
##D            max(max(ndl$XMx[, 1]),max(nPost$etaMar[,1])))
##D 	#Find the limits in y-axis.
##D par(mar=c(4, 4, 1, 1))
##D plot(ndl$XMx[, 2], ndl$XMx[, 1], col="blue", 
##D 		xlab="Time (min)", ylab="Northing (KM)", 
##D      type="l", lwd=2, ylim=nYlim)
##D 	#Plot the uncorrected DR path
##D lines(ndl$XMx[, 2], nPost$etaMar[,1], lwd=2)
##D 	#Add the posterior mean of eta
##D 	#the corrected path from our Bayesian Melding approach
##D lines(ndl$XMx[, 2], nPost$etaMar[,1] +
##D 		1.96*sqrt(nPost$etaMar[,2]), lwd=2, col="grey70")
##D 	#Add the upper bound of the 95% credible interval
##D lines(ndl$XMx[, 2], nPost$etaMar[,1] - 
##D 		1.96*sqrt(nPost$etaMar[,2]), lwd=2, col="grey70")
##D 	#Add the lower bound
##D legend("topleft", bty="n", legend=c("Posterior Mean", 
##D 	"95% Credible Interval", "GPS Observations", 
##D 	"Uncorrected DRA Results"),text.col=c(1, "grey70", 2, 4), 
##D 	lty=c(1, 1, -1, 1), pch=c(-1, -1, 16, -1), 
##D 	col=c(1, "grey70", 2, 4))
##D 	#Add a legend
##D points(ndl$glist$Gtime, ndl$g$Y, col="red", pch=16, cex=0.7)
##D 	#Add the original GPS observations.
##D 	
##D 	
##D ###Analyze the Easting direction	
##D ##Prepare the data list that will be used in our Baysian Melding
##D edl <- as.dataList(Trip1DR$Xdim/1000, Trip1GPSinKM$Easting, 
##D                    Ytime=strptime(Trip1GPS$DateTime, "%d-%b-%Y %H:%M:%S"), 
##D                    Xtime=strptime(Trip1DR$DateTime, "%d-%b-%Y %H:%M:%S"), 
##D                    s2G=0.0625, timeUnit=60, betaOrder=1)
##D 
##D ##The Bayesian Melding to correct bias and qualify uncertianty	
##D ePost <- BMAnimalTrack(edl, BMControl(print=TRUE, returnParam=TRUE))
##D 	#A list similar to nPost
##D 
##D ##Plot the results in Easting direction.
##D ##Produce a plot similar to Figure 4 in our paper
##D eYlim <- c(min(min(edl$XMx[, 1]),min(ePost$etaMar[,1])),  
##D            max(max(edl$XMx[, 1]),max(ePost$etaMar[,1])))
##D 	#Find the limits in y-axis.
##D par(mar=c(4, 4, 1, 1))
##D plot(edl$XMx[, 2], edl$XMx[, 1], col="blue", 
##D 		xlab="Time (min)", ylab="Easting (KM)", 
##D      type="l", lwd=2, ylim=eYlim)
##D 	#Plot the uncorrected DR path
##D lines(edl$XMx[, 2], ePost$etaMar[,1], lwd=2)
##D 	#Add the posterior mean of eta
##D 	#the corrected path from our Bayesian Melding approach
##D lines(edl$XMx[, 2], ePost$etaMar[,1] +
##D 		1.96*sqrt(ePost$etaMar[,2]), lwd=2, col="grey70")
##D 	#Add the upper bound of the 95% credible interval
##D lines(edl$XMx[, 2], ePost$etaMar[,1] - 
##D 		1.96*sqrt(ePost$etaMar[,2]), lwd=2, col="grey70")
##D 	#Add the lower bound
##D legend("bottomright", bty="n", legend=c("Posterior Mean", 
##D 	"95% Credible Interval", "GPS Observations", 
##D 	"Uncorrected DRA Results"),text.col=c(1, "grey70", 2, 4), 
##D 	lty=c(1, 1, -1, 1), pch=c(-1, -1, 16, -1), 
##D 	col=c(1, "grey70", 2, 4))
##D 	#Add a legend
##D points(edl$glist$Gtime, edl$g$Y, col="red", pch=16, cex=0.7)
##D 	#Add the original GPS observations.
##D 
##D ###Combine the results in both dimensions,
##D ###and calculate the corrected path in degrees.
##D cPathInKM <- cbind(ePost$etaMar[,1], nPost$etaMar[,1])
##D 	#first column is easting and second column northing in  KM.
##D cPathInDeg <- KMToDeg(cPathInKM, Trip1GPSformat [1, c(3, 2)])
##D 	#Get the longitude and latitude of the starting points
##D 	#first longitude and then latitude.
##D 
##D ##Produce a plot similar to Figure 2 of Liu et al. (2014b)	
##D plot(cPathInDeg[, ], type="l", lwd=2)
##D 	#plot the corrected path
##D points(Trip1GPSformat [, c(3, 2)], col="red", pch=16)
##D 	#add the original GPS observations.
##D 
##D 
## End(Not run)



