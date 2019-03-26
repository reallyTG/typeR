library(sitools)


### Name: kilo
### Title: SI prefixes
### Aliases: yotta zetta exa peta tera giga mega kilo hecto deca deci centi
###   milli micro nano pico femto atto zepto yocto
### Keywords: utilities misc aplot methods

### ** Examples

library(sitools)

# dice have a volume of (in metres)
a <- 1 * centi
volumedice <- a^3
volumedice

# how many dice fit in a box with
# 10 cm height
# 20 cm length 
# 30 cm width

volumebox <- 10*centi * 20*centi * 30*centi

volumebox / volumedice



