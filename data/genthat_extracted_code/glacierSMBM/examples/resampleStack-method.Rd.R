library(glacierSMBM)


### Name: resampleStack-method
### Title: Method: Resample a RasterStack object
### Aliases: resampleStack-method
###   resampleStack,RasterStack,RasterLayer-method
### Keywords: ~kwd1 ~kwd2

### ** Examples

# Load the provided RasterLayer objects as exemplary
# input for the function
data(airTemperature_30m_daily, precip_10km_daily,
    package = "glacierSMBM")
# Individual RasterLayer objects should be loaded or created
# using the function raster()

# Resample and interpolate a precipitation file with 10 km spatial
# resolution using the parameters of air temperature (30m)
# Additionally, convert from mm h-1 to m d-1
output <- resampleStack(stack(precip_10km_daily),
    airTemperature_30m_daily,1, writeOutput = FALSE,
    u1 = "mm/h", u2 = "mm/d", decimalPlaces = 5)

# Plot output
plot(precip_10km_daily, main = "precipitation (10km)",
    legend.args=list(text='precipitation (m)', side=3, line=1.5))
plot(output, main = "resampled precipitation (30m)",
    legend.args=list(text='precipitation (m)', side=3, line=1.5))



