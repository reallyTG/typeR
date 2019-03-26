library(IsoriX)


### Name: isomultiscape
### Title: Predicts the average spatial distribution of isotopic values
###   over months, years...
### Aliases: isomultiscape
### Keywords: models predict prediction regression

### ** Examples


## The examples below will only be run if sufficient time is allowed
## You can change that by typing e.g. options_IsoriX(example_maxtime = XX)
## if you want to allow for examples taking up to ca. XX seconds to run
## (so don't write XX but put a number instead!)

if(getOption_IsoriX("example_maxtime") > 180) {

## We prepare the data and split them by month:

GNIPDataDEmonthly <- prepsources(data = GNIPDataDE,
                                 split_by = "month")

dim(GNIPDataDEmonthly)

## We fit the isoscapes:#' 
GermanMultiFit <- isomultifit(data = GNIPDataDEmonthly,
                              mean_model_fix = list(elev = TRUE, lat.abs = TRUE))

## We build the annual isoscapes by simple averaging (equal weighting):
GermanMultiscape <- isomultiscape(raster = ElevRasterDE,
                                  isofit = GermanMultiFit)

## We build the annual isoscapes with a weighing based on precipitation amount:
GermanMultiscapeWeighted <- isomultiscape(raster = ElevRasterDE,
                                          isofit = GermanMultiFit,
                                          weighting = PrecipBrickDE)

## We plot the mean isoscape of the averaging with equal weighting:
plot(x = GermanMultiscape, which = "mean")

## We plot the mean isoscape of the averaging with precipitation weighting:
plot(x = GermanMultiscapeWeighted, which = "mean")

## We build the isoscapes for a given month (here January):
GermanScapeJan <- isoscape(raster = ElevRasterDE,
                           isofit = GermanMultiFit$multi_fits[["month_1"]])
                         
## We plot the mean isoscape for January:
plot(x = GermanScapeJan, which = "mean")

}



