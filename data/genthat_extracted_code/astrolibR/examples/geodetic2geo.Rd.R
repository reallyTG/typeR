library(astrolibR)


### Name: geodetic2geo
### Title: Convert from geodetic (or planetodetic) to geographic
###   coordinates
### Aliases: geodetic2geo
### Keywords: misc

### ** Examples

# Convert North Pole, zero altitude, to geographic coordinates
# Results: 90.000000       0.0000000      -21.385000
geodetic2geo(c(90,0,0))

# Same calculation but for Mars
# Results: 90.000000       0.0000000      -18.235500
geodetic2geo(c(90,0,0),'mars')



