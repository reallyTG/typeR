library(rgeolocate)


### Name: maxmind
### Title: Geolocate IP Addresses through MaxMind Databases
### Aliases: maxmind

### ** Examples


# An example, using the country-level dataset shipped with rgeolocate.
file <- system.file("extdata","GeoLite2-Country.mmdb", package = "rgeolocate")
results <- maxmind("196.200.60.51", file, "country_code")



