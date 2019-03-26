library(glacierSMBM)


### Name: snowFall-method
### Title: Method: Snowfall model
### Aliases: snowFall-method
###   snowFall,RasterStack,RasterStack,RasterStack-method
### Keywords: ~kwd1 ~kwd2

### ** Examples

# Load the provided RasterLayer objects as exemplary
# input for the function
# Individual RasterLayer objects should be loaded or
# created using the function raster()
data(airTemperature_30m_daily, precip_30m_daily,
    glacierMask_30m, package = "glacierSMBM")

# Include RasterLayer in RasterStack
AirTemperature_30m_daily <- stack(airTemperature_30m_daily)
Precip_30m_daily <- stack(precip_30m_daily)
GlacierMask_30m <- stack(glacierMask_30m)

# Calculate snow fall from air temperature and total
# precipitation using standard settings
output <- snowFall(airT = AirTemperature_30m_daily,
    precip = Precip_30m_daily, glacierMask = GlacierMask_30m)

# Plot output
plot(output, main = "snow fall",
    legend.args=list(text='Snowfall (m)', side=3, line=1.5))

# Calculate snow fall from air temperature and total
# precipitation using modified settings (e.g. snow transition
# is changed from 1 to 0 degree Celsius) and general
# precipitation tuning factor is set from 1 to 0.8)
output <- snowFall(airT = AirTemperature_30m_daily,
    precip = Precip_30m_daily, glacierMask = GlacierMask_30m,
    tuningFacPrecip = 0.8, snowTransTempThreshold = 273.15)

# Plot output
plot(output, main = "snow fall",
    legend.args=list(text='Snowfall (m)', side=3, line=1.5))



