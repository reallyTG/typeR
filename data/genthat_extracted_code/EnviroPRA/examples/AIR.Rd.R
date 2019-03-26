library(EnviroPRA)


### Name: AIR
### Title: Inhalation of airborne chemicals
### Aliases: AIR
### Keywords: methods

### ** Examples

## Estimated absorbed dose for the estimation of carcinogenic effects using 
# the default variables (EPA 2011) for a chemical air concentration 
# of 0.2 mg/m^3

AIR ( CA=0.2)

# For a systemic effect:

AIR ( CA=0.2, AT=24*365)

# Specifying all the parameters for the carcinogenic case

AIR ( CA=0.2, IR=25, ET = 24, EF = 300, ED = 24, BW = 85)



