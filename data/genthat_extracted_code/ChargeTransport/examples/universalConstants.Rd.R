library(ChargeTransport)


### Name: universalConstants
### Title: universal Constants
### Aliases: universalConstants
### Keywords: datasets

### ** Examples

# List all the constants
print(universalConstants)

# Data for the speed of light
universalConstants["c",]

# Return the speed of light in m.s-1
universalConstants["c","Value"]

# Return the Planck constant in J.s
universalConstants["h","Value"]

# Return the Planck constant in eV.s
Joule2electronVolt(universalConstants["h","Value"])




