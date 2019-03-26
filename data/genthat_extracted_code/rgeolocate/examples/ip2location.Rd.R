library(rgeolocate)


### Name: ip2location
### Title: Geolocate IP Addresses through IP2Location Databases
### Aliases: ip2location

### ** Examples

file <- system.file("extdata","ip2_sample.bin", package = "rgeolocate")
example_ip <- "2A04:0000:0000:0000:0000:0000:0000:0000"

ip2location(example_ip, file, c("country_code", "country_name", "region", "city"))




