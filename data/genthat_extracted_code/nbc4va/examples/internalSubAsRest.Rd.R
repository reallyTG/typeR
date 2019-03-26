library(nbc4va)


### Name: internalSubAsRest
### Title: Substitute values in a dataframe proportionally to all other
###   values
### Aliases: internalSubAsRest
### Keywords: internal

### ** Examples

library(nbc4va)
data(nbc4vaDataRaw)
unclean <- nbc4vaDataRaw
clean <- nbc4va:::internalSubAsRest(unclean, 99)




