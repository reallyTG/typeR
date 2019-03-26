library(ega)


### Name: getParkesZones
### Title: Assign Parkes (Consensus) error grid zones to paired glucose
###   values
### Aliases: getParkesZones

### ** Examples

zones <- getParkesZones(glucose_data$ref, glucose_data$test)

# counts
table(zones)

# percentages
round (table (zones) / length (zones) * 100, digits=2)



