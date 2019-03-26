library(bsearchtools)


### Name: bsearchtools-package
### Title: Binary Search Tools
### Aliases: bsearchtools-package bsearchtools
### Keywords: package manip iteration programming

### ** Examples

require(bsearchtools)

######################################################
### get indexes of values in range
### search values in range [2,4]

# N.B. v must be sorted !
v1 <- sort(c(3,5,7,10,4,8,13,3,2))

indexesInRangeNumeric(v1,2,4)
# is identical to:
which(v1 >= 2 & v1 <= 4)

######################################################
### What if vector is not sorted ? 
### (and we're going to perform a lot of lookups on it)

v2 <- c(3,5,7,10,4,8,13,3,2)

# we can create two intermediate vectors
ordIdxs <- order(v2)
sortedV2 <- v2[ordIdxs]

# then use them as follows :
ordIdxs[indexesInRangeNumeric(sortedV2,2,4)]

# this returns the same indexes :
# N.B. : 'which' returns ascending indexes while the previous line does not:
# sort the result if you want them ascending
which(v2 >= 2 & v2 <= 4)

######################################################
###### N.B. the previous code is basically what is performed by DFI objects under the hood
######      check DFI function documentation for further information
DF <- data.frame(v2=v2)
DFIobj <- DFI(DF)
indexes <- DFI.subset(DFIobj,RG('v2',2,4),return.indexes=TRUE)

## Not run: 
##D ######################################################
##D ### big example to measure the performance difference
##D set.seed(123) # for reproducibility
##D sortedValues <- sort(sample(1:1e4,1e5,replace=TRUE))
##D 
##D # measure time difference doing same operation 500 times
##D tm1 <- system.time( for(i in 1:500) res2 <- which(sortedValues >= 7000 & sortedValues <= 7500))
##D tm2 <- system.time( for(i in 1:500) res1 <- indexesInRangeInteger(sortedValues,7000,7500))
##D 
##D print(paste("'which' took:",tm1["elapsed"]))
##D print(paste("'indexesInRangeInteger' took:",tm2["elapsed"]))
##D 
## End(Not run)





