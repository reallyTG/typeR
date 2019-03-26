library(accrued)


### Name: asOf
### Title: Function to recover the current data.
### Aliases: asOf

### ** Examples

	data(accruedDataExample)	# simulated accrued data
	testData <- data.accrued(accruedDataExample)	
	currentData <- asOf(testData)
	plot(currentData)
	currentData <- asOf(testData, currentDate=20) # If dates are indexed from 1.
	plot(currentData)

	testData <- data.accrued(accruedDataExample, start="2010-04-20")	
	currentData <- asOf(testData, currentDate="2010-07-12") 
	L = dim(currentData)[1] 
	yMax = max(currentData[,1], na.rm=TRUE) + 100
	num_labels = round(L/4,0)
	y_tick_places = seq(0, yMax, by=round(yMax/num_labels,0))
	x_indices = 1:L
	x_tick_places = x_indices[(0:num_labels)*3]
	x_labels = dimnames(currentData)[[1]][(0:num_labels)*3]
	plot(currentData[,1], axes=FALSE, xlab="", ylab="Current counts", ylim=c(0,yMax))
	abline(h=0)
	abline(v=0)
	axis(1, at=x_tick_places, labels=x_labels, las=2 )
	axis(2, at=y_tick_places, labels=y_tick_places, las=2 )
	
	## Not run: 
##D 	library(animation)
##D 	# Requires a separate application called "ImageMagik"
##D 
##D 		NROW = nrow(testData[["data"]])
##D 		saveGIF({
##D 			for( R in 1:NROW ) {
##D 				plot( 	c(0, NROW+1), 
##D 						c(0, max(dat[["data"]], na.rm=TRUE)), 
##D 						type='n', xlab='day', ylab='count' )
##D 				currentValues = asOf(testData, currentDate=R)	
##D 				points(1:R, currentValues)
##D 				lines(1:R, currentValues, col='lightblue')
##D 			}
##D 		}, cmd.fun=system, interval=0.1)
##D 	
## End(Not run)

	
	



