library(wux)


### Name: alpinesummer
### Title: Timeseries example of CMIP5 data over Greater Alpine Region in
###   summer
### Aliases: alpinesummer
### Keywords: datasets

### ** Examples

## thats what alpinesummer looks like
data("alpinesummer")
head(alpinesummer)
## it really is a timeseries! hooraay!

## get an idea what the data look like
require(lattice)
## Not run: 
##D xyplot(air_temperature ~ year|gcm,
##D        groups = acronym,
##D        data = alpinesummer,
##D        type = c("l", "g"),
##D        main = "JJA temperature of CMIP5 over Greater Alpine Region\nRCP 4.5 forcing")
## End(Not run)
## have fun playing around with the data :)



