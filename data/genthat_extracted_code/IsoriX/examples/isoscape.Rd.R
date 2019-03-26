library(IsoriX)


### Name: isoscape
### Title: Predicts the spatial distribution of source isotopic values
### Aliases: isoscape print.isoscape summary.isoscape
### Keywords: models predict prediction regression

### ** Examples


## The examples below will only be run if sufficient time is allowed
## You can change that by typing e.g. options_IsoriX(example_maxtime = XX)
## if you want to allow for examples taking up to ca. XX seconds to run
## (so don't write XX but put a number instead!)

if(getOption_IsoriX("example_maxtime") > 30) {

## We prepare the data
GNIPDataDEagg <- prepsources(data = GNIPDataDE)

## We fit the models
GermanFit <- isofit(data = GNIPDataDEagg,
                    mean_model_fix = list(elev = TRUE, lat_abs = TRUE))

## We build the isoscapes
GermanScape <- isoscape(raster = ElevRasterDE, isofit = GermanFit)

GermanScape
plot(GermanScape)

## We build more plots
PlotMean <- plot(x = GermanScape, which = "mean", plot = FALSE)

PlotMeanPredVar <- plot(x = GermanScape, which = "mean_predVar", plot = FALSE)

PlotMeanResidVar <- plot(x = GermanScape, which = "mean_residVar", plot = FALSE)

PlotMeanRespVar <- plot(x = GermanScape, which = "mean_respVar", plot = FALSE)

## We display the plots
print(PlotMean, split = c(1, 1, 2, 2), more = TRUE)
print(PlotMeanPredVar,  split = c(2, 1, 2, 2), more = TRUE)
print(PlotMeanResidVar, split = c(1, 2, 2, 2), more = TRUE)
print(PlotMeanRespVar,  split = c(2, 2, 2, 2), more = FALSE)
 
## We build a sphere with our isoscape
plot(x = GermanScape, which = "mean", plot = FALSE, sphere = list(build = TRUE))
 
## We can save a rotating sphere with the isoscape as a .gif-file.
## This file will be located inside your working directory.
## Make sure your current rgl device (from the previous step) is still open
## and that you have both the packages 'rgl' and 'magick' installed.
## The building of the .gif implies to create temporarily many .png
## but those will be removed automatically once the .gif is done.
## Uncomment to proceed (after making sure you have rgl and magick installed)
#if(require("rgl") & require("magick")) {
#   movie3d(spin3d(axis = c(0, 0, 1), rpm = 2), duration = 30, dir = getwd())
#}

}




