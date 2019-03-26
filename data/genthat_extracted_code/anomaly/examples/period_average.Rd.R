library(anomaly)


### Name: period_average
### Title: A function to search the Kepler data for periodically recurring
###   dips in luminosity
### Aliases: period_average

### ** Examples

library(anomaly)
data(Lightcurves)
### Plot the data for Kepler 10965588: No transit apparent
plot(Lightcurves$Kepler10965588$Day,Lightcurves$Kepler10965588$Brightness,xlab = "Day",pch=".")
### Examine a period of 62.9 days for Kepler 10965588
binned_data = period_average(Lightcurves$Kepler10965588,62.9)
inferred_anomalies = anomaly_series(binned_data)
plot(inferred_anomalies,xlab="Bin")
# We found a planet! 



