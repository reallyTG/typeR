library(slippymath)


### Name: lonlat_to_merc
### Title: Transform between spherical Mercator and longitude/latitude
### Aliases: lonlat_to_merc merc_to_lonlat

### ** Examples

uluru_lonlat <- matrix(c(131.0325162,
                         -25.3448562),
                       nrow = 1)

lonlat_to_merc(uluru_lonlat)

uluru_merc <- matrix(c(14586472.958481,
                       -2918162.223463),
                     nrow = 1)

merc_to_lonlat(uluru_merc)



