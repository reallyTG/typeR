library(kSamples)


### Name: ShorelineFireEMS
### Title: Shoreline Fire and EMS Turnout Times
### Aliases: ShorelineFireEMS
### Keywords: datasets

### ** Examples

data(ShorelineFireEMS)
boxplot(ShorelineFireEMS$EMSTOT,xlab="Station", ylab="seconds",
	main="EMS Turnout Time")
boxplot(ShorelineFireEMS$FireTOT,xlab="Station", ylab="seconds",
	main="Fire Turnout Time")



