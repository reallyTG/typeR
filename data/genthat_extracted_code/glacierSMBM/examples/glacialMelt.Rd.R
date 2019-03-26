library(glacierSMBM)


### Name: glacialMelt
### Title: Function: Ablation model
### Aliases: glacialMelt
### Keywords: ~kwd1 ~kwd2

### ** Examples

# Load the provided RasterLayer objects as exemplary
# input for the function
data(airTemperature_30m_daily, netRad_30m_daily,
    airDensity_30m_daily, glacierMask_30m, iceMask_30m,
    firnMask_30m, debrisMask_30m, debrisThickness_30m,
    package = "glacierSMBM")
# Individual RasterLayer objects should be loaded or
# created using the function raster()

# Include RasterLayer in RasterStack
AirTemperature_30m_daily <- stack(airTemperature_30m_daily * 1.01)
NetRad_30m_daily <- stack(netRad_30m_daily)
AirDensity_30m_daily <- stack(airDensity_30m_daily)
GlacierMask_30m <- stack(glacierMask_30m)
IceMask_30m <- stack(iceMask_30m)
FirnMask_30m <- stack(firnMask_30m)
DebrisThickness_30m <- stack(debrisThickness_30m)
DebrisMask_30m <- stack(debrisMask_30m)

## Not run: 
##D # Calculate ablation using standard settings
##D output <- glacialMelt(airT = AirTemperature_30m_daily,
##D     netRad = NetRad_30m_daily, airDensity = AirDensity_30m_daily,
##D     glacierMask = GlacierMask_30m, iceMask = IceMask_30m,
##D     snowMask = FirnMask_30m, debrisMask = DebrisMask_30m,
##D     debrisThickness = DebrisThickness_30m)
##D 
##D # Plot output
##D plot(output, main = c("snow melt", "bare ice melt",
##D     "debris covered ice melt","total ablation"),
##D     legend.args=list(text='Melt (m d-1)', side=3, line=1.5))
## End(Not run)

# Calculate ablation using modified setting (e.g. input
# temperature in celsius instead of kelvin and
# increased thermal conductivity)

# Therefore exemplarily convert temperature from
# kelvin to degree celsius
airTcelsius <- AirTemperature_30m_daily - 273.15

# Include RasterLayer in RasterStack
airTcelsius <- stack(airTcelsius)

## Not run: 
##D output <- glacialMelt(airT = airTcelsius, netRad =
##D     NetRad_30m_daily, airDensity <- AirDensity_30m_daily,
##D     glacierMask = GlacierMask_30m, iceMask = IceMask_30m,
##D     snowMask = FirnMask_30m, debrisMask = DebrisMask_30m,
##D     debrisThickness = DebrisThickness_30m, tUnit = "C",
##D     thermalConductivity = 1.5)
##D 
##D # Plot output
##D plot(output, main = c("snow melt", "bare ice melt",
##D     "debris covered ice melt","total ablation"),
##D     legend.args=list(text='Melt (m d-1)', side=3, line=1.5))
## End(Not run)




