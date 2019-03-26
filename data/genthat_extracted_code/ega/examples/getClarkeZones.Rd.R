library(ega)


### Name: getClarkeZones
### Title: Assign Clarke error grid zones to paired glucose values
### Aliases: getClarkeZones

### ** Examples

zones <- getClarkeZones (glucose_data$ref / 18, glucose_data$test / 18,
unit="mol")

# counts
table(zones)

# percentages
round (table (zones) / length (zones) * 100, digits=2)




