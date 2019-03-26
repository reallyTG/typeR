library(discharge)


### Name: getFPExt
### Title: Flood Pulse Extent (FPExt)
### Aliases: getFPExt

### ** Examples

# load sample data
data("sycamore")
x = sycamore

# get streamflow object for the sample data
x.streamflow = asStreamflow(x)

# prepare baseline signal 
x.bl = prepareBaseline(x.streamflow)

# FPExt
fpext = getFPExt(x.bl$resid.sig, x.streamflow$data$year)




