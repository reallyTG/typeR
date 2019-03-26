library(discharge)


### Name: getLSAM
### Title: Low Spectral Anomaly Mangitude (LSAM)
### Aliases: getLSAM

### ** Examples

# load sample data
data("sycamore")
x = sycamore

# get streamflow object for the sample data
x.streamflow = asStreamflow(x)

# prepare baseline signal 
x.bl = prepareBaseline(x.streamflow)

# LSAM
lsam = getLSAM(x.bl$resid.sig, x.streamflow$data$year)




