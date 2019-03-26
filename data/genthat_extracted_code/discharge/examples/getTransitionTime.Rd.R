library(discharge)


### Name: getTransitionTime
### Title: Transition Time
### Aliases: getTransitionTime

### ** Examples

# load sample data
data("sycamore")
x = sycamore

# get streamflow object for the sample data
x.streamflow = asStreamflow(x)

# prepare baseline signal 
x.bl = prepareBaseline(x.streamflow)

# get HSAM and LSAM values
hsam = getHSAM(x.bl$resid.sig, x.streamflow$data$year)
lsam = getLSAM(x.bl$resid.sig, x.streamflow$data$year)

# transition time
tt = getTransitionTime(hsam$Index.all, lsam$Index.all, hsam$year)




