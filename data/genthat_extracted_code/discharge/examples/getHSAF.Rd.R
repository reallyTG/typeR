library(discharge)


### Name: getHSAF
### Title: High Spectral Anomaly Frequency (HSAF)
### Aliases: getHSAF

### ** Examples

# load sample data
data("sycamore")
x = sycamore

# get streamflow object for the sample data
x.streamflow = asStreamflow(x)

# prepare baseline signal 
x.bl = prepareBaseline(x.streamflow)

# HSAF
hsaf = getHSAF(x.bl$resid.sig, x.streamflow$data$year)




