library(glacierSMBM)


### Name: debrisThicknessEmp
### Title: Function: Empirical debris thickness model
### Aliases: debrisThicknessEmp
### Keywords: ~kwd1 ~kwd2

### ** Examples

# Load the provided data set and RasterLayer as exemplary
# input for the function. The values of the data set do not
# represent real field measurements and were only created for
# demonstration purposes 
data(debrisThickness_measured, lst_measured, lst_30m_hourly,
    package = "glacierSMBM")
# Individual data sets or RasterLayers should be loaded using
# the functions read.*() or raster(), respectively

# Calculate the required fitting parameters for the
# function debrisThicknessEmp()
Fitting_Parameters <- debrisThicknessFit(surfaceTemperature =
    lst_measured, debrisThickness = debrisThickness_measured,
    plotOutput = FALSE)

# Derive debris thickness from land surface temperature using
# an empirical model
output <- debrisThicknessEmp(disSurfaceTemperature =
    lst_30m_hourly, fittingParameters = Fitting_Parameters)

# Plot output
plot(output, main = "debris thickness",
    legend.args=list(text='Debris thickness (m)',
    side=3, line=1.5))



