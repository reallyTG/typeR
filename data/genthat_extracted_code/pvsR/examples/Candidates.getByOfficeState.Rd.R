library(pvsR)


### Name: Candidates.getByOfficeState
### Title: Get a list of candidates according to office and state
###   representation
### Aliases: Candidates.getByOfficeState

### ** Examples

# First, make sure your personal PVS API key is saved as character string in the pvs.key variable:
## Not run: pvs.key <- "yourkey"
# get a data frame of candidates according to all state/office/electionYear combinations
## Not run: 
##D candidates <- Candidates.getByOfficeState(stateId=list("NJ","NY"),officeId=list(6,7),
##D electionYear=list(2012,2008), all=TRUE)
## End(Not run)
## Not run: candidates
# get a data frame of candidates according to the exact state/office/electionYear combinations
# (i.e., "NY"/6/2012, "NJ"/7/2008)
## Not run: 
##D candidates <- Candidates.getByOfficeState(stateId=list("NJ","NY"),officeId=list(6,7),
##D  electionYear=list(2012,2008), all=FALSE)
## End(Not run)
## Not run: candidates



