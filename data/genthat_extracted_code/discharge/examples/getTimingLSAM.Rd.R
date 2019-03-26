library(discharge)


### Name: getTimingLSAM
### Title: Time of occurence of Low Spectral Anomaly Magnitude (LSAM)
### Aliases: getTimingLSAM

### ** Examples

# load sample data
data("sycamore")
x = sycamore

# get streamflow object for the sample data
x.streamflow = asStreamflow(x)

# prepare baseline signal 
x.bl = prepareBaseline(x.streamflow)

# get signal parts
x.sp = getSignalParts(x.bl$pred2, candmin = c(40:125), candmax = c(190:330),
                      years = x.streamflow$data$year, 
                      months = x.streamflow$data$month,
                      jdays = x.streamflow$data$jday)

# get LSAM values
lsam = getLSAM(x.bl$resid.sig, x.streamflow$data$year)

# timing LSAM
tlsam = getTimingLSAM(lsam$Index.all, x.sp$peak.index, x.sp$year)




