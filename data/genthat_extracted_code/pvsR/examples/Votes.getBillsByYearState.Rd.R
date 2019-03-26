library(pvsR)


### Name: Votes.getBillsByYearState
### Title: Get a list of bills according to year and state
### Aliases: Votes.getBillsByYearState

### ** Examples

# First, make sure your personal PVS API key is saved as character string in the pvs.key variable:
## Not run: pvs.key <- "yourkey"
# get a data frame of bills according to all year and state combinations
## Not run: 
##D bills <- Votes.getBillsByYearState(year=list(2011,2012),
##D stateId=list("NY","NJ"), all=TRUE)
## End(Not run)
## Not run: head(bills)
# get a data frame of bills according to the exact year and state combinations
# (i.e., 2011/"NY", 2012/"NJ")
## Not run: 
##D bills <- Votes.getBillsByYearState(year=list(2011,2012),
##D stateId=list("NY","NJ"), all=FALSE)
## End(Not run)
## Not run: head(bills)



