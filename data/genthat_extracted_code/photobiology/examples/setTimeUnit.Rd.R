library(photobiology)


### Name: setTimeUnit
### Title: Set the "time.unit" attribute of an existing source_spct object
### Aliases: setTimeUnit

### ** Examples

my.spct <- sun.spct
setTimeUnit(my.spct, time.unit = "second")
setTimeUnit(my.spct, time.unit = lubridate::duration(1, "seconds"))




