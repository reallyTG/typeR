library(glacierSMBM)


### Name: snowMelt-method
### Title: Method: Snow melt model
### Aliases: snowMelt-method
###   snowMelt,RasterStack,RasterStack,RasterStack,RasterStack-method
### Keywords: ~kwd1 ~kwd2

### ** Examples


# Load the provided RasterLayer objects as exemplary
# input for the function
data(airTemperature_30m_daily, netRad_30m_hourly,
    glacierMask_30m, firnMask_30m, package = "glacierSMBM")
# Individual RasterLayer objects should be loaded or
# created using the function raster()

# Include RasterLayer in RasterStack
AirTemperature_30m_daily <- stack(airTemperature_30m_daily * 1.01)
NetRad_30m_hourly <- stack(netRad_30m_hourly)
GlacierMask_30m <- stack(glacierMask_30m)
FirnMask_30m <- stack(firnMask_30m)

# Calculate snow melt using standard settings
output <- snowMelt(airT = AirTemperature_30m_daily,
    netRad = NetRad_30m_hourly, glacierMask = GlacierMask_30m,
    snowMask = FirnMask_30m)

# Plot output
plot(output, main = "snow melt",
    legend.args=list(text='Snow melt (m d-1)', side=3, line=1.5))

# Calculate snow melt using modified setting (e.g. air
# temperature in degree Celsius instead of Kelvin; changes
# melting factors)
# Therefore exemplarily convert temperature from kelvin to
# degree Celsius
airTcelsius <- subset(AirTemperature_30m_daily, 1) - 273.15

# Include RasterLayer in RasterStack
airTcelsius <- stack(airTcelsius)

output <- snowMelt(airT = airTcelsius,
    netRad = NetRad_30m_hourly, glacierMask = GlacierMask_30m,
    tUnit = "C", snowMask = FirnMask_30m, snowTMF = 75*10^-4,
    snowRMF = 1.2*10^-4)

# Plot output
plot(output, main = "snow melt",
    legend.args=list(text='Snow melt (m d-1)', side=3, line=1.5))



