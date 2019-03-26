library(discharge)


### Name: getSignalParts
### Title: Signal parts
### Aliases: getSignalParts

### ** Examples

# load sample data
data("sycamore")
x = sycamore

# get streamflow object for the sample data
x.streamflow = asStreamflow(x)

# prepare baseline signal 
x.bl = prepareBaseline(x.streamflow)

# signal parts
x.sp = getSignalParts(x.bl$pred2, candmin = c(40:125), candmax = c(190:330),
                      years = x.streamflow$data$year, 
                      months = x.streamflow$data$month,
                      jdays = x.streamflow$data$jday)




