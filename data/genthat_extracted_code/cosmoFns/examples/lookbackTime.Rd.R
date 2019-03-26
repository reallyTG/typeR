library(cosmoFns)


### Name: lookbackTime
### Title: Cosmic lookback time
### Aliases: lookbackTime
### Keywords: misc

### ** Examples

# lookback time for z = 2
lookbackTime(2)
# Inverse problem, age of Earth (4.6 Gyr) example:
uniroot(function(x) lookbackTime(x) - 4.6, c(0,2))$root



