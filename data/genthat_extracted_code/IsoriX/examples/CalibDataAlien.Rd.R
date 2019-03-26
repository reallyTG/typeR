library(IsoriX)


### Name: CalibDataAlien
### Title: Simulated calibration dataset
### Aliases: CalibDataAlien
### Keywords: datasets

### ** Examples


head(CalibDataAlien)
str(CalibDataAlien)

## The examples below will only be run if sufficient time is allowed
## You can change that by typing e.g. options_IsoriX(example_maxtime = XX)
## if you want to allow for examples taking up to ca. XX seconds to run
## (so don't write XX but put a number instead!)

if(getOption_IsoriX("example_maxtime") > 30) {

## We prepare the precipitation data
GNIPDataDEagg <- prepsources(data = GNIPDataDE)

## We fit the models for Germany
GermanFit <- isofit(data = GNIPDataDEagg)

## We build the isoscape
GermanScape <- isoscape(raster = ElevRasterDE, isofit = GermanFit)

## We create a simulated dataset with 50 site and 10 observations per site
set.seed(2L)
CalibDataAlien <- create_aliens(calib_fn = list(intercept = 3, slope = 0.5, resid_var = 5),
                                isoscape = GermanScape,
                                raster = ElevRasterDE,
                                n_sites = 50,
                                min_n_samples = 10,
                                max_n_samples = 10)
plot(sample_value ~ source_value, data = CalibDataAlien)
abline(3, 0.5)

CalibDataAlien$source_value <- NULL

## Uncomment the following to store the file as we did
#save(CalibDataAlien, file = "CalibDataAlien.rda", compress = "xz")

}





