library(drsmooth)


### Name: spline.plot
### Title: Plot Spline
### Aliases: spline.plot

### ** Examples

# Produces and plots the spline model with confidence bounds.
# For the same plot with key metrics, see drsmooth().
# For continuous outcomes:
data(DRdata)
spline.plot("dose", "MF_Log",  k = 4, data_type = "continuous", data=DRdata)

# For dichotomous outcomes:
data(DIdata)
# If necessary, convert summarized dataframe into 1 row per case dataframe (see drsmooth::expand)
DIdata_expanded <- expand(dosecolumn = "Dose", targetcolumn = "Tumor", ncolumn = "n", data = DIdata)
spline.plot("Dose", "Tumor", k = 4, data_type = "dichotomous", data=DIdata_expanded)



