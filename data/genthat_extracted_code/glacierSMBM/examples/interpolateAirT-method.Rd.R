library(glacierSMBM)


### Name: interpolateAirT-method
### Title: Method: Air temperature interpolation
### Aliases: interpolateAirT-method
###   interpolateAirT,RasterStack,numeric,RasterLayer-method
### Keywords: ~kwd1 ~kwd2

### ** Examples

# Load the provided RasterLayer objects as exemplary
# input for the function
data(airTemperature_10km_daily, dem_30m, srtm_dem_30m,
    package = "glacierSMBM")
# Individual RasterLayer objects should be loaded or
# created using the function raster()

# Calculate difference between SRTM1 DEM and resampled
# reanalysis DEM
DEM_Diff <- dem_30m - srtm_dem_30m

# Interpolate the temperature obtained from a reanalysis data set
# using a lapse rate and the altitude difference of the resampled
# reanalysis DEM and a high resolution DEM (e.g. SRTM1)
output <- interpolateAirT(airT = stack(airTemperature_10km_daily),
    lapseRate = 0.007, demDiff = DEM_Diff)

# Plot output
plot(airTemperature_10km_daily, main = "initial air
    temperature (10km)", legend.args=list(text='Temperature (K)',
    side=3, line=1.5))
plot(output, main = "interpolated air temperature (30m)",
    legend.args=list(text='Temperature (K)', side=3, line=1.5))



