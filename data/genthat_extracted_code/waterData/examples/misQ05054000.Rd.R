library(waterData)


### Name: misQ05054000
### Title: Daily mean streamflow with missing values
### Aliases: misQ05054000
### Keywords: datasets NA ts

### ** Examples

data(exampleWaterData)
par(las=1, tck=0.02, mar=c(5,5,4,2), mex=1.2, cex.axis=.9)
plot(misQ05054000$dates, misQ05054000$val, type="l", log="y", 
     ylab="Streamflow, in cubic feet per second", 
     xlab="", yaxs='i', xaxs='i', 
     xlim=c(as.Date("2000-01-01"), as.Date("2012-01-01")), ylim=c(10,50000), 
     yaxt="n")
axis(2, axTicks(2), format(axTicks(2), big.mark=","))
title("Red River of the North at Fargo, North Dakota")
summary(misQ05054000$val)



