library(GA)


### Name: gaControl
### Title: A function for setting or retrieving defaults genetic operators
### Aliases: gaControl

### ** Examples

# get and save defaults
defaultControl <- gaControl()
print(defaultControl)
# get current defaults only for binary search
gaControl("binary")
# set defaults for selection operator of binary search
gaControl("binary" = list(selection = "gabin_tourSelection"))
gaControl("binary")
# set defaults for selection and crossover operators of binary search
gaControl("binary" = list(selection = "ga_rwSelection", 
                          crossover = "gabin_uCrossover"))
gaControl("binary")
# restore defaults
gaControl(defaultControl)
gaControl()



