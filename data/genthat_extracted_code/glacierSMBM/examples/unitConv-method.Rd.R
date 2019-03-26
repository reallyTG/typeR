library(glacierSMBM)


### Name: unitConv-method
### Title: Method: Unit conversion of a RasterLayer object
### Aliases: unitConv-method
###   unitConv,RasterLayer,character,character-method
### Keywords: ~kwd1 ~kwd2

### ** Examples


# Load the provided RasterLayer objects as exemplary
# input for the function
data(airTemperature_30m_daily, precip_30m_daily,
    package = "glacierSMBM")
# Individual RasterLayer objects should be loaded or
# created using the function raster()

# Convert air temperature from Kelvin to degree Celsius
output <- unitConv(airTemperature_30m_daily, "kelvin", "celsius")

# Plot output
plot(airTemperature_30m_daily, main = "Air Temperature [Kelvin]",
    legend.args=list(text='Temperature (K)', side=3, line=1.5))
plot(output, main = "Air Temperature [Celsius]",
    legend.args=list(text='Temperature (Celsius)',
    side=3, line=1.5))

# Convert precipitation from m d-1 to mm h-1
output <- unitConv(precip_30m_daily, "m/d", "mm/h")

# Plot output
plot(precip_30m_daily, main = "Precipitation [m/d]",
    legend.args=list(text='Precipitation (m/d)',
    side=3, line=1.5))
plot(output, main = "Precipitation [mm/h]",
    legend.args=list(text='Precipitation (mm/h)',
    side=3, line=1.5))



