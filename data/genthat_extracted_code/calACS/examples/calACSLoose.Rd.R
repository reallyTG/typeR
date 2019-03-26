library(calACS)


### Name: calACSLoose
### Title: Calculate the total number of all common subsequences between a
###   string and a vector/list of strings. Subsequences can be interrupted
###   by items, i.e. q-w is considered a subsequence of q-e-w-r
### Aliases: calACSLoose

### ** Examples

calACSLoose("q-w-e-r", c("q-e-w-r","q-r-e-w"), "-")
calACSLoose("itemToBeDropped-q-w-e-r", "itemToBeDroped-q-e-w-r", "-", dropFirstItem=TRUE)




