library(poweRlaw)


### Name: get_ntail
### Title: Values greater than or equal to xmin
### Aliases: get_ntail

### ** Examples

################################################
# Load data and create example object
################################################
data(moby_sample)
m = displ$new(moby_sample)
m$setXmin(7)
################################################
# Get ntail
################################################
get_ntail(m)
sum(moby_sample >= 7)



