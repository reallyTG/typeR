library(calACS)


### Name: lenLCSStrict
### Title: Calculate the length of the longest common subsequence (KCS)
###   between a string and a vector/list of strings. Subsequences cannot be
###   interrupted by any item, i.e. q-w is not considered a subsequence of
###   q-e-w-r due to the interrupting 'e'
### Aliases: lenLCSStrict

### ** Examples

lenACSStrict("q-w-e-r", c("q-e-w-r","q-r-e-w","q-w-r-e"), "-")
lenACSStrict("itemToBeDropped-q-w-e-r", "itemToBeDroped-q-e-w-r", "-", dropFirstItem=TRUE)




