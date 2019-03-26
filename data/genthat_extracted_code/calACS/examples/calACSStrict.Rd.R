library(calACS)


### Name: calACSStrict
### Title: Count the total number of all common subsequences between a
###   string and a vector/list of strings. Subsequences cannot be
###   interrupted by any item, i.e. q-w is not considered a subsequence of
###   q-e-w-r due to the interrupting 'e'
### Aliases: calACSStrict

### ** Examples

calACSStrict("q-w-e-r", c("q-e-w-r","q-r-e-w"), "-")
calACSStrict("itemToBeDropped-q-w-e-r", "itemToBeDroped-q-e-w-r", "-", dropFirstItem=TRUE)




