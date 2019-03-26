library(anomaly)


### Name: print.anomaly_series
### Title: Print function for anomaly_series objects.
### Aliases: print.anomaly_series

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
print(inferred_anomalies)




