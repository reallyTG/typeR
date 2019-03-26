library(pvsR)


### Name: Candidates.getByOfficeTypeState
### Title: Get a list of candidates according to office type and state
###   representation
### Aliases: Candidates.getByOfficeTypeState

### ** Examples

# First, make sure your personal PVS API key is saved as character string in the pvs.key variable:
## Not run: pvs.key <- "yourkey"
# get a data frame of candidates according to all state/officeType/electionYear combinations
## Not run: 
##D candidates <- Candidates.getByOfficeTypeState(stateId=list("NJ","NY"),
##D officeTypeId=list("C","L"), electionYear=list(2012,2008), all=TRUE)
## End(Not run)
## Not run: candidates
# get a data frame of candidates according to the exact state/officeType/electionYear combinations
# (i.e., "NY"/6/2012, "NJ"/7/2008)
## Not run: 
##D candidates <- Candidates.getByOfficeTypeState(stateId=list("NJ","NY"),
##D officeTypeId=list("C","L"), electionYear=list(2012,2008), all=FALSE)
## End(Not run)
## Not run: candidates



