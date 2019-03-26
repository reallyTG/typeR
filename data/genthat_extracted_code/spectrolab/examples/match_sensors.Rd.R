library(spectrolab)


### Name: match_sensors
### Title: Match spectra at sensor transitions
### Aliases: match_sensors match_sensors.spectra

### ** Examples

library(spectrolab)
data(spec_with_jump)
spec = spec_with_jump
spec = match_sensors(spec, splice_at = c(971, 1910), fixed_sensor = 2)



