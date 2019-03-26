library(pvsR)


### Name: getAllVotes
### Title: Get several votes
### Aliases: getAllVotes

### ** Examples

# First, make sure your personal PVS API key is saved as character string in the pvs.key variable:
## Not run: pvs.key <- "yourkey"
# get all officials of a certain state
## Not run: bill <- Votes.getBill("17623", separate=c("actions", "sponsors"))
## Not run: actionids <- bill$actions$actionId
# get all votes on this acti
## Not run: votes <- getAllVotes(actionids, batchsize=2)
## Not run: head(votes)



