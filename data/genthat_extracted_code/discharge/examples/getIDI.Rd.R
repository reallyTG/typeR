library(discharge)


### Name: getIDI
### Title: Inter-Draught Interval (IDI)
### Aliases: getIDI

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

# IDI
idi = getIDI(x.bl$resid.sig, x.streamflow$data$year, x.sp$HF.window.start, 
             x.sp$HF.window.end, x.sp$year)




