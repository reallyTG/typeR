library(pvsR)


### Name: Committee.getCommitteesByTypeState
### Title: Get a list of committees according to type and state
### Aliases: Committee.getCommitteesByTypeState

### ** Examples

# First, make sure your personal PVS API key is saved as character string in the pvs.key variable:
## Not run: pvs.key <- "yourkey"
# get a data frame of committees according to all type/state combinations
## Not run: 
##D committees <- Committee.getCommitteesByTypeState(typeId=list("H","S"),
##D stateId=list("NY","NJ"), all=TRUE)
## End(Not run)
## Not run: committees
# get a data frame of committees according to the exact type/state combinations
# (i.e., "H"/"NY", "S"/"NJ")
## Not run: 
##D committees <- Committee.getCommitteesByTypeState(typeId=list("H","S"),
##D stateId=list("NY","NJ"), all=FALSE)
## End(Not run)
## Not run: committees



