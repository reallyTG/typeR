library(drsmooth)


### Name: drsmooth
### Title: Dose-response Modeling with Smoothing Splines
### Aliases: drsmooth

### ** Examples

# Produces and plots spline model with confidence bounds, and prints key metrics.
# For the plot only, see spline.plot
# The STD_bias is defaulted here to FALSE to speed run time.
# For continuous outcomes
data(DRdata)
drsmooth("dose", "MF_Log", data_type = "continuous", k = 4, return_predict = FALSE,
write_predict = FALSE, STD_bias = FALSE, data=DRdata)

# For dichotomous outcomes
data(DIdata)
# If necessary, convert summarized dataframe into 1 row per case dataframe (see drsmooth::expand)
DIdata_expanded <- expand(dosecolumn = "Dose", targetcolumn = "Tumor", ncolumn = "n", data = DIdata)

drsmooth("Dose", "Tumor", data_type = "dichotomous", return_predict = FALSE,
write_predict = FALSE, STD_bias = FALSE, data=DIdata_expanded)



