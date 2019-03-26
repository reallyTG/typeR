library(anomaly)


### Name: anomaly_series
### Title: A technique for detecting anomalous segments based on CAPA
###   (Collective And Point Anomaly) by Fisch et al.
### Aliases: anomaly_series

### ** Examples

library(anomaly)
set.seed(2018)
# Generate data typically following a normal distribution with mean 0 and variance 1. 
# Then introduce 3 anomaly windows and 4 point outliers.
x  = rnorm(5000)
x[401:500]   = rnorm(100,4,1)
x[1601:1800] = rnorm(200,0,0.01)
x[3201:3500] = rnorm(300,0,10)
x[c(1000,2000,3000,4000)] = rnorm(4,0,100)
inferred_anomalies = anomaly_series(x)
plot(inferred_anomalies)
summary(inferred_anomalies)
print(inferred_anomalies)

### Repeat with other method

inferred_anomalies = anomaly_series(x,method="mean")
plot(inferred_anomalies)
summary(inferred_anomalies)
print(inferred_anomalies)

### Real data example: 

library(anomaly)
data(Lightcurves)
### Plot the data for Kepler 10965588: No transit apparent
plot(Lightcurves$Kepler10965588$Day,Lightcurves$Kepler10965588$Brightness,xlab = "Day",pch=".")
### Examine a period of 62.9 days for Kepler 10965588
binned_data = period_average(Lightcurves$Kepler10965588,62.9)
inferred_anomalies = anomaly_series(binned_data)
plot(inferred_anomalies,xlab="Bin")
# We found a planet! 




