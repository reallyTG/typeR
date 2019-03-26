library(astrolibR)


### Name: geo2geodetic
### Title: Convert from geographic/planetographic to geodetic coordinates
### Aliases: geo2geodetic
### Keywords: misc

### ** Examples

# Locate the geographic North pole for Earth, altitude 0., in geodetic coordinates
# Returns: 90.000000       0.0000000       21.385000
geo2geodetic(c(90.0,0.0,0.0) )

# As above, but for the case of Mars
# Returns:  90.000000       0.0000000       18.235500
geo2geodetic(c(90.0,0.0,0.0), 'mars') 



