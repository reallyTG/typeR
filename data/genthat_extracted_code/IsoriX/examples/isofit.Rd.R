library(IsoriX)


### Name: isofit
### Title: Fit the isoscape models
### Aliases: isofit print.ISOFIT summary.ISOFIT
### Keywords: models regression

### ** Examples


## The examples below will only be run if sufficient time is allowed
## You can change that by typing e.g. options_IsoriX(example_maxtime = XX)
## if you want to allow for examples taking up to ca. XX seconds to run
## (so don't write XX but put a number instead!)

if(getOption_IsoriX("example_maxtime") > 10) {

## Fitting the models for Germany
GNIPDataDEagg <- prepsources(data = GNIPDataDE)

GermanFit <- isofit(data = GNIPDataDEagg, mean_model_fix = list(elev = TRUE, lat_abs = TRUE))

GermanFit

## Diagnostics for the fits
plot(GermanFit)

## Exploration of the fitted models
GermanFit$mean_fit
GermanFit$disp_fit
AIC(GermanFit$disp_fit)

}




