library(photobiology)


### Name: add_attr2tb
### Title: Copy attributes from members of a generic_mspct
### Aliases: add_attr2tb when_measured2tb lonlat2tb lon2tb lat2tb
###   geocode2tb what_measured2tb

### ** Examples


library(dplyr)

my.mspct <- source_mspct(list(sun1 = sun.spct, sun2 = sun.spct * 2))
q_irrad(my.mspct) %>%
  add_attr2tb(my.mspct, c(lat = "latitude",
                          lon = "longitude",
                          when.measured = "time"))

when_measured2tb(my.mspct)




