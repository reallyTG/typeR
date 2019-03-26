library(MLID)


### Name: impacts
### Title: Impact calculations
### Aliases: impacts

### ** Examples

data(aggdata)
impx <- impacts(aggdata, c("Bangladeshi", "WhiteBrit"), c("LAD","RGN"))
head(impx)
# sorted by impact score
# For $RGN London has the greatest impact on the ID
# The 'excess' share of the Bangladeshi population is not especially
# significant (see scldMean) but there is a lot of variation between
# neighbourhoods (see scldSD)
# For $LAD note the impacts of Tower Hamlets and Newham



