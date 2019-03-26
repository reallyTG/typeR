library(EcoHydRology)


### Name: ConvertFlowUnits
### Title: Unit conversion for flow rates
### Aliases: ConvertFlowUnits

### ** Examples

data(OwascoInlet)
OwascoInlet$Streamflow_mmd<-ConvertFlowUnits(cms=OwascoInlet$Streamflow_m3s,WA=271.,AREAunits="km2")

##  The following commented example isn't currently working in Linux systems, but should 
##  work in windows/macs
##
##  Get some streamflow (reported in cubic meters per day here):
# OI <- get_usgs_gage("04235299", "2013-03-01", "2013-05-20")
# FC <- get_usgs_gage("04234000", "2013-03-01", "2013-05-20")

##  Convert to mm/d
# OwascoInlet_mmd <- ConvertFlowUnits(cmd=OI$flowdata$flow, WA=OI$area, AREAunits="km2")
# FallCreek_mmd <- ConvertFlowUnits(cmd=FC$flowdata$flow, WA=FC$area, AREAunits="km2")

##  Compare the watershed area normalized flow depth for two watersheds near Ithaca NY :
# hydrograph(streamflow=OwascoInlet_mmd, streamflow2=FallCreek_mmd, timeSeries=FC$flowdata$mdate, 
# stream.label="flow depth (mm/d)")
# legend("topright", legend=c("Owasco Inlet", "Fall Creek"), lty=c(1,2), col=c("black", "red"))



