library(glacierSMBM)


### Name: debrisThicknessPhy
### Title: Function: Physical debris thickness model
### Aliases: debrisThicknessPhy
### Keywords: ~kwd1 ~kwd2

### ** Examples

# Load the provided RasterLayer objects as exemplary input for
# the function
data(lst_30m_hourly, airTemperature_30m_hourly, netRad_30m_hourly,
    airPressure_30m_hourly, package = "glacierSMBM")
# Individual RasterLayer objects should be loaded or
# created using the function raster()

# Derive debris thickness from land surface temperature using
# standard settings
output <- debrisThicknessPhy(surfaceTemperature = lst_30m_hourly,
    airT = airTemperature_30m_hourly, netRad = netRad_30m_hourly,
    airP = airPressure_30m_hourly)

# Plot output
plot(output, main = "debris thickness",
    legend.args=list(text='Debris thickness (m)',
    side=3, line=1.5))

# Derive debris thickness from land surface temperature using
# modified settings (e.g. change numeric values for effective
# thermal conductivity and wind speed)

output <- debrisThicknessPhy(surfaceTemperature = lst_30m_hourly,
    airT = airTemperature_30m_hourly, netRad = netRad_30m_hourly,
    airP = airPressure_30m_hourly, windSpeed = 6,
    thermalConductivity = 0.86)

# Plot output
plot(output, main = "debris thickness",
    legend.args=list(text='Debris thickness (m)',
    side=3, line=1.5))



