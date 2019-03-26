library(cheddar)


### Name: CP
### Title: Single community properties
### Aliases: CP
### Keywords: utilities

### ** Examples

data(TL84)
CP(TL84, 'title')

CP(TL84, 'lat')

CP(TL84, 'M.units')

# Returns a vector of NA
CP(TL84, 'not a property')



