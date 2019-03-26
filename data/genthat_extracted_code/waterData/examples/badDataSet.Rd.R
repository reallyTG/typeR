library(waterData)


### Name: badDataSet
### Title: Hydrologic dataset with provisional and negative data.
### Aliases: badDataSet
### Keywords: datasets NA ts

### ** Examples

data(exampleWaterData)
par(las=1, tck=0.02, mar=c(5,5,4,2), mex=1.2, cex.axis=0.75)
plot(badDataSet$dates, badDataSet$val, type="l",  
     ylab="Streamflow, in cubic feet per second", 
     xlab="", yaxs='i', xaxs='i', 
     xlim=c(as.Date("2000-01-01"), as.Date("2012-01-01")), 
     yaxt="n", col="blue")
axis(2, axTicks(2), format(axTicks(2), big.mark=",", scientific=FALSE))
title("Red River of the North at Fargo, North Dakota")
summary(badDataSet$val)



