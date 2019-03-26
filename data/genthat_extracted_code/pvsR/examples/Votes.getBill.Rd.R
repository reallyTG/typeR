library(pvsR)


### Name: Votes.getBill
### Title: Get general information on a bill
### Aliases: Votes.getBill

### ** Examples

# First, make sure your personal PVS API key is saved as character string in the pvs.key variable:
## Not run: pvs.key <- "yourkey"
# get information about certain bills
## Not run: billinfo <- Votes.getBill(list(2819,6427))
## Not run: billinfo
# let some variables with subnodes be returned separately (here: "sponsors" and "actions")
## Not run: 
##D billinfo2 <- Votes.getBill(billId=list(2819,6427,6590),
##D separate=c("sponsors","actions"))
## End(Not run)
## Not run: billinfo2
# check the sponsors of the requested bill (argument of separate)...
## Not run: billinfo2$sponsors
# ... and the usual variables describing the bill (nodes not mentioned in separate)
## Not run: billinfo2$main



