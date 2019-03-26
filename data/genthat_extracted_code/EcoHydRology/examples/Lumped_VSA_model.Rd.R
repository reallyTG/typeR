library(EcoHydRology)


### Name: Lumped_VSA_model
### Title: Lumped Variable Source Area (VSA) Watershed Model
### Aliases: Lumped_VSA_model

### ** Examples

data(OwascoInlet)
# First get rain and snow-melt input: 
rsm <- SnowMelt(Date=OwascoInlet$date, precip_mm=OwascoInlet$P_mm, Tmax_C=OwascoInlet$Tmax_C, 
Tmin_C=OwascoInlet$Tmin_C, lat_deg=42.66)
# Calculate streamflow based on watershed characteristics:
Results <- Lumped_VSA_model(dateSeries = OwascoInlet$date, 	P = rsm$Rain_mm+rsm$SnowMelt_mm, 
Tmax=OwascoInlet$Tmax_C, Tmin = OwascoInlet$Tmin_C, latitudeDegrees=42.66, Tp = 5.8, Depth = 2010, 
SATper = 0.27, AWCper = 0.13, StartCond = "wet")
#  View results:
hydrograph(streamflow=ConvertFlowUnits(cms=OwascoInlet$Streamflow_m3s, WA=106, AREAunits="mi2"), 
timeSeries=OwascoInlet$date, streamflow2=Results$modeled_flow, precip=rsm$Rain_mm+rsm$SnowMelt_mm)



