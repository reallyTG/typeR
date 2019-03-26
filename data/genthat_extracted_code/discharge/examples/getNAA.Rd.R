library(discharge)


### Name: getNAA
### Title: Net Annual Anomaly (NAA)
### Aliases: getNAA

### ** Examples

# load sample data
data("sycamore")
x = sycamore

# get streamflow object for the sample data
x.streamflow = asStreamflow(x)

# prepare baseline signal 
x.bl = prepareBaseline(x.streamflow)

# NAA
naa = getNAA(x.bl$resid.sig, x.streamflow$data$year)




