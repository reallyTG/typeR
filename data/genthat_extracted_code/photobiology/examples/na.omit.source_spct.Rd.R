library(photobiology)


### Name: na.omit.source_spct
### Title: Handle Missing Values in Objects
### Aliases: na.omit.source_spct na.omit.response_spct na.omit.filter_spct
###   na.omit.reflector_spct na.omit.cps_spct na.omit.raw_spct
###   na.omit.chroma_spct na.exclude.generic_spct

### ** Examples

my_sun.spct <- sun.spct
my_sun.spct[3, "s.e.irrad"] <- NA
my_sun.spct[5, "s.q.irrad"] <- NA
na.omit(my_sun.spct)
na.action(na.omit(my_sun.spct))




