library(carcass)


### Name: search.efficiency
### Title: Estimates detection probability per person and visibility
###   classes using a binomial model
### Aliases: search.efficiency
### Keywords: misc

### ** Examples

data(searches)
searches

# Call to the function with data provided as data.frame:
## Not run: search.efficiency(searches)

# Alternative:
per <- searches$person
visi <- searches$visibility
det <- searches$detected
notdet <- searches$notdetected
## Not run: search.efficiency(person=per, visibility=visi, detected=det, notdetected=notdet)




