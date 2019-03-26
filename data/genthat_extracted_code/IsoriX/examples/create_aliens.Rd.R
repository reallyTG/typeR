library(IsoriX)


### Name: create_aliens
### Title: Simulate datasets for calibrations or assignments
### Aliases: create_aliens
### Keywords: simulate simulation

### ** Examples


## The examples below will only be run if sufficient time is allowed
## You can change that by typing e.g. options_IsoriX(example_maxtime = XX)
## if you want to allow for examples taking up to ca. XX seconds to run
## (so don't write XX but put a number instead!)

if(getOption_IsoriX("example_maxtime") > 30) {

## We fit the models for Germany
GNIPDataDEagg <- prepsources(data = GNIPDataDE)

GermanFit <- isofit(data = GNIPDataDEagg)

## We build the isoscapes
GermanScape <- isoscape(raster = ElevRasterDE, isofit = GermanFit)

## We create a simulated dataset with 25 sites and 5 observations per site
Aliens <- create_aliens(calib_fn = list(intercept = 3, slope = 0.5, resid_var = 5),
                        isoscape = GermanScape,
                        raster = ElevRasterDE,
                        n_sites = 25,
                        min_n_samples = 5,
                        max_n_samples = 5)

## We display the simulated dataset
Aliens

## We plot the relationship between the environmental isotope values
## and those from the simulated organisms
plot(sample_value ~ source_value, data = Aliens, ylab = "Tissue", xlab = "Environment")
abline(3, 0.5, col = "blue") ## the true relationship

## We create a simulated dataset with 2 sites imputing coordinates manually
Aliens2 <- create_aliens(calib_fn = list(intercept = 3, slope = 0.5, resid_var = 5),
                         isoscape = GermanScape,
                         coordinates = data.frame(site_ID = c("Berlin", "Bielefeld"),
                                                  long   = c(13.52134, 8.49914),
                                                  lat    = c(52.50598, 52.03485)),
                         raster = ElevRasterDE,
                         min_n_samples = 5,
                         max_n_samples = 5)

Aliens2

}




