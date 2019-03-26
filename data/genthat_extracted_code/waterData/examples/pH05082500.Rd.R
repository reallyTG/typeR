library(waterData)


### Name: pH05082500
### Title: Hydrologic dataset with provisional and negative data.
### Aliases: pH05082500
### Keywords: datasets NA ts

### ** Examples

data(exampleWaterData)
par(las=1, tck=0.02, mar=c(3,5,2,2), cex.axis=0.75)
plot(pH05082500$dates, pH05082500$val, type="l",  
     ylab="Daily median pH, water, \nunfiltered, field, standard units", 
     xlab="", yaxs='i', xaxs='i', ylim=c(7.4, 9), 
     xlim=c(as.Date("2007-01-01"), as.Date("2012-01-01")), col="red")
title("Red River of the North at Grand Forks, North Dakota",cex.main=0.95)
summary(pH05082500$val)



