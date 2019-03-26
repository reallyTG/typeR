library(photobiology)


### Name: setWhenMeasured
### Title: Set the "when.measured" attribute
### Aliases: setWhenMeasured setWhenMeasured.default
###   setWhenMeasured.generic_spct setWhenMeasured.summary_generic_spct
###   setWhenMeasured.generic_mspct

### ** Examples

my.spct <- sun.spct
getWhenMeasured(my.spct)
setWhenMeasured(my.spct, lubridate::ymd_hms("2015-12-12 08:00:00"))
getWhenMeasured(my.spct)




