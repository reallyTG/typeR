library(miceadds)


### Name: nestedList2List
### Title: Converting a Nested List into a List (and Vice Versa)
### Aliases: nestedList2List List2nestedList

### ** Examples

#############################################################################
# EXAMPLE 1: List conversions using a small example
#############################################################################

# define a nestedList
nestedList <- as.list(1:3)
nestedList[[1]] <- as.list( 2:4 )
nestedList[[2]] <- as.list( 34 )
nestedList[[3]] <- as.list( 4:9 )

# convert a nested list into a list
v2 <- miceadds::nestedList2List( nestedList)

## reconvert list v2 into a nested list, looping within first
v3 <- miceadds::List2nestedList(v2, N_between=5)
# looping between first
v4 <- miceadds::List2nestedList(v2, N_between=5, loop_within=FALSE)



