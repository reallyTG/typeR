library(glacierSMBM)


### Name: iceMelt-method
### Title: Method: Ice melt model
### Aliases: iceMelt-method
###   iceMelt,RasterStack,RasterStack,RasterStack,RasterStack-method
### Keywords: ~kwd1 ~kwd2

### ** Examples

# Load the provided RasterLayer objects as exemplary
# input for the function
data(airTemperature_30m_daily, netRad_30m_hourly,
    glacierMask_30m, iceMask_30m, package = "glacierSMBM")
# Individual RasterLayer objects should be loaded or
# created using the function raster()

# Include RasterLayer in RasterStack
AirTemperature_30m_daily <- stack(airTemperature_30m_daily)
NetRad_30m_hourly <- stack(netRad_30m_hourly)
GlacierMask_30m <- stack(glacierMask_30m)
IceMask_30m <- stack(iceMask_30m)

# Calculate ice melt using standard settings
output <- iceMelt(airT = AirTemperature_30m_daily,
    netRad = NetRad_30m_hourly, glacierMask = GlacierMask_30m,
    iceMask = IceMask_30m)

# Plot output
plot(output, main = "ice melt",
    legend.args=list(text='Ice melt (m d-1)', side=3, line=1.5))

# Calculate ice melt using modified setting (e.g. air temperature
# in degree Celsius instead of Kelvin; changes melting factors)
# Therefore exemplarily convert temperature from kelvin to celsius
airTcelsius <- subset(AirTemperature_30m_daily, 1) - 273.15

# Include RasterLayer in RasterStack
airTcelsius <- stack(airTcelsius)

output <- iceMelt(airT = airTcelsius, netRad = NetRad_30m_hourly,
    glacierMask = GlacierMask_30m, tUnit = "C",
    iceMask = IceMask_30m, iceTMF = 75*10^-4, iceRMF = 1.2*10^-4)

# Plot output
plot(output, main = "ice melt",
    legend.args=list(text='Ice melt (m d-1)', side=3, line=1.5))



