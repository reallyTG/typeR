library(glacierSMBM)


### Name: interpolateAirP
### Title: Function: Air pressure interpolation
### Aliases: interpolateAirP
### Keywords: ~kwd1 ~kwd2

### ** Examples

# Load the provided RasterLayer objects as exemplary
# input for the function
data(airPressure_10km_daily, airTemperature_30m_daily,
    dem_30m, srtm_dem_30m, package = "glacierSMBM")
# Individual RasterLayer objects should be loaded or
# created using the function raster()

# Calculate difference between SRTM1 DEM and
# resampled reanalysis DEM
DEM_Diff <- dem_30m - srtm_dem_30m

# Interpolate the air pressure obtained from a reanalysis data
# set using a lapse rate and the altitude difference of the
# resampled DEM and high resolution DEM (e.g. SRTM1)
output <- interpolateAirP(airP = stack(airPressure_10km_daily),
    airT = stack(airTemperature_30m_daily), lapseRate = 0.007,
    demDiff = DEM_Diff)

# Plot output
plot(airPressure_10km_daily, main = "air pressure (10km)",
    legend.args=list(text='Pressure (Pa)', side=3, line=1.5))
plot(output, main = "interpolated air pressure (30m)",
    legend.args=list(text='Pressure (Pa)', side=3, line=1.5))



