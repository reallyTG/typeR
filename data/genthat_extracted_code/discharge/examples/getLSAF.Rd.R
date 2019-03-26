library(discharge)


### Name: getLSAF
### Title: Low Spectral Anomaly Frequency (LSAF)
### Aliases: getLSAF

### ** Examples

# load sample data
data("sycamore")
x = sycamore

# get streamflow object for the sample data
x.streamflow = asStreamflow(x)

# prepare baseline signal 
x.bl = prepareBaseline(x.streamflow)

# LSAF
lsaf = getLSAF(x.bl$resid.sig, x.streamflow$data$year)




