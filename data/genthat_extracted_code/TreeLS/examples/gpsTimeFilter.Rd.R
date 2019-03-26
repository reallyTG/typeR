library(TreeLS)


### Name: gpsTimeFilter
### Title: Filter points based on gpstime
### Aliases: gpsTimeFilter

### ** Examples

file = system.file("extdata", "model_boles.laz", package="TreeLS")
tls = readTLS(file)

### color points according to its chronological time stamp
plot(tls, color='gpstime')

### keep points registered in the 70% to 95% time interval
tls = gpsTimeFilter(tls, .7, .95)
plot(tls, color='gpstime')




