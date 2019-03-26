library(pvsR)


### Name: District.getByOfficeState
### Title: Get district IDs according to the office and state
### Aliases: District.getByOfficeState

### ** Examples

# First, make sure your personal PVS API key is saved as character string in the pvs.key variable:
## Not run: pvs.key <- "yourkey"
# get districts for certain office and state IDs
## Not run: districts <- District.getByOfficeState(officeId=list(8,9),stateId=list("NY","NJ"))
## Not run: district
# get a data frame of districts according to all state/office/districtName combinations
## Not run: 
##D districts <- District.getByOfficeState(officeId=list(8,9),stateId=list("NY","NJ"),
##D  districtName=list(1,2), all=TRUE)
## End(Not run)
## Not run: districts
# get a data frame of districts according to the exact state/office/districtName combinations
# (i.e., 8/"NY"/1, 9/"NJ"/2)
## Not run: 
##D districts <- District.getByOfficeState(officeId=list(8,9),stateId=list("NY","NJ"),
##D  districtName=list(1,2), all=FALSE)
## End(Not run)
## Not run: districts



