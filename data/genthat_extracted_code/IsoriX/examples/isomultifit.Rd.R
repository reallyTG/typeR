library(IsoriX)


### Name: isomultifit
### Title: Fit isoscape models per strata (typically time interval such as
###   months)
### Aliases: isomultifit

### ** Examples


## The examples below will only be run if sufficient time is allowed
## You can change that by typing e.g. options_IsoriX(example_maxtime = XX)
## if you want to allow for examples taking up to ca. XX seconds to run
## (so don't write XX but put a number instead!)

if(getOption_IsoriX("example_maxtime") > 30) {

## We prepare the GNIP monthly data between January and June for Germany

GNIPDataDEmonthly <- prepsources(data = GNIPDataDE,
                                 month = 1:6,
                                 split_by = "month")

head(GNIPDataDEmonthly)

## We fit the isoscapes

GermanMonthlyFit <- isomultifit(data = GNIPDataDEmonthly)

GermanMonthlyFit

plot(GermanMonthlyFit)
}



