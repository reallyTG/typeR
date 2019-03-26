library(discharge)


### Name: getHSAM
### Title: High Spectral Anomaly Mangitude (HSAM)
### Aliases: getHSAM

### ** Examples

# load sample data
data("sycamore")
x = sycamore

# get streamflow object for the sample data
x.streamflow = asStreamflow(x)

# prepare baseline signal 
x.bl = prepareBaseline(x.streamflow)

# HSAM
hsam = getHSAM(x.bl$resid.sig, x.streamflow$data$year)




