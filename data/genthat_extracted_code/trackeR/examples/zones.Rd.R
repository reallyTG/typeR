library(trackeR)


### Name: zones
### Title: Time spent in training zones.
### Aliases: zones

### ** Examples

data('run', package = 'trackeR')
runZones <- zones(run, what = 'speed', breaks = list(speed = c(0, 2:6, 12.5)))
## if breaks is a named list, argument 'what' can be left unspecified
runZones <- zones(run, breaks = list(speed = c(0, 2:6, 12.5)))
## if only a single variable is to be evaluated, 'breaks' can also be a vector
runZones <- zones(run, what = 'speed', breaks = c(0, 2:6, 12.5))
plot(runZones)



