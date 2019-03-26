library(dLagM)


### Name: warming
### Title: Global warming and vehicle prediction data
### Aliases: warming
### Keywords: datasets

### ** Examples

data(warming)
vehicleWarming.ts = ts(warming[,2:3], start = 1997)
plot(vehicleWarming.ts, main="Time series plots 
of global warming and the nuber of produced motor 
vehciles series.")



