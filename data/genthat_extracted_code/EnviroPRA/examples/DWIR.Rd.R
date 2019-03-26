library(EnviroPRA)


### Name: DWIR
### Title: Chemical intake by Drinking Water
### Aliases: DWIR
### Keywords: methods

### ** Examples

# Estimate the dermal absorbed dose during swiming in waters with a carcinogenic chemical
# (water concentration of 250 mg/m^3)

DWIR ( CW = 250)

# For a systemic effect:

DWIR ( CW= 250, AT=24*365)

# Specifying all the parameters for the carcinogenic case

DWIR ( CW=250, IR=1.5, EF = 300, ED = 24, BW = 85)



