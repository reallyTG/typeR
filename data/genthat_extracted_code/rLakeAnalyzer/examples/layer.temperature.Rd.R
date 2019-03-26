library(rLakeAnalyzer)


### Name: layer.temperature
### Title: Returns the average temperature of a layer between two depths.
### Aliases: layer.temperature
### Keywords: manip

### ** Examples


	# Supply input data
	top     <- 2
	bottom  <- 6
	wtr     <- c(25.2,25.1,24.1,22.0,19.8,15.3,12.0,11.1)
	depths  <- c(0,1,2,3,4,5,6,7) 
	bthA    <- c(10000,8900,5000,3500,2000,1000,300,10)
	bthD    <- c(0,1,2,3,4,5,6,7)
	
	#Return the average temperature of the water column between 2 and 6 meters.
	layer.temperature(top,bottom,wtr,depths,bthA,bthD)



