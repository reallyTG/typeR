library(IsoriX)


### Name: calibfit
### Title: Fit the calibration model
### Aliases: calibfit print.CALIBFIT summary.CALIBFIT
### Keywords: models regression

### ** Examples


## The examples below will only be run if sufficient time is allowed
## You can change that by typing e.g. options_IsoriX(example_maxtime = XX)
## if you want to allow for examples taking up to ca. XX seconds to run
## (so don't write XX but put a number instead!)

if(getOption_IsoriX("example_maxtime") > 30) {

## We prepare the data:
GNIPDataDEagg <- prepsources(data = GNIPDataDE)

## We fit the models for Germany:
GermanFit <- isofit(data = GNIPDataDEagg,
                    mean_model_fix = list(elev = TRUE, lat_abs = TRUE))

## We fit the calibration model:
CalibAlien <- calibfit(data = CalibDataAlien, isofit = GermanFit)

## We display minimal information:
CalibAlien

## We display more information:
summary(CalibAlien)

## We plot the calibration function:
plot(CalibAlien)

## Add other calibrations on the same plot
CalibDataAlien3 <- CalibDataAlien2 <- CalibDataAlien
CalibDataAlien2$sample_value <- rnorm(nrow(CalibDataAlien2),
  mean = CalibDataAlien2$sample_value, sd = 10)
CalibDataAlien3$sample_value <- rnorm(nrow(CalibDataAlien3),
  mean = CalibDataAlien3$sample_value, sd = 10)
CalibAlien2 <- calibfit(data = CalibDataAlien2, isofit = GermanFit)
CalibAlien3 <- calibfit(data = CalibDataAlien3, isofit = GermanFit)
plot(CalibAlien3)
points(CalibAlien)
points(CalibAlien2, pch = 3, col = "green", CI = list(col = "green"))


}




