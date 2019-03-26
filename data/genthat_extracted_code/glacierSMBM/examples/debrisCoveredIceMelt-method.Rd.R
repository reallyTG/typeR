library(glacierSMBM)


### Name: debrisCoveredIceMelt-method
### Title: Method: Sub-debris ice melt model
### Aliases: debrisCoveredIceMelt-method
###   debrisCoveredIceMelt,RasterStack,RasterStack,RasterStack,RasterStack,RasterStack-method

### ** Examples

# Load the provided RasterLayer objects
# as exemplary input for the function
data(glacierMask_30m, debrisThickness_30m, debrisMask_30m,
    airTemperature_30m_daily, airDensity_30m_daily,
    netRad_30m_daily, package = "glacierSMBM")
# Individual RasterLayer objects should be loaded
# or created using the function raster()

# Include RasterLayers in RasterStack
GlacierMask <- stack(glacierMask_30m)
DebrisThickness <- stack(debrisThickness_30m)
DebrisMask <- stack(debrisMask_30m)
AirTemperature <- stack(airTemperature_30m_daily)
AirDensity <- stack(airDensity_30m_daily)
NetRad <- stack(netRad_30m_daily)

# Calculate ice melt under a porous debris layer
# using standard settings
output <- debrisCoveredIceMelt(airT = AirTemperature,
    netRad = NetRad, airDensity = AirDensity,
    glacierMask = GlacierMask, debrisMask = DebrisMask,
    debrisThickness = DebrisThickness)

# Plot output
plot(output, main = "debris covered ice melt",
    legend.args=list(text='Ice melt (m d-1)', side=3, line=1.5))

# Calculate ice melt under a porous debris layer using modified
# settings (e.g. change numeric values for thermal conductivity
# and temporal resolution)
output <- debrisCoveredIceMelt(airT = AirTemperature,
    netRad = NetRad, airDensity = AirDensity,
    glacierMask = GlacierMask, debrisMask = DebrisMask,
    debrisThickness = DebrisThickness, thermalConductivity = 1.5,
    tmpRes = "h")

# Plot output
plot(output, main = "debris covered ice melt",
    legend.args=list(text='Ice melt (m h-1)', side=3, line=1.5))



