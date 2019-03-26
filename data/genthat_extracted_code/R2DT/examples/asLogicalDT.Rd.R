library(R2DT)


### Name: asLogicalDT
### Title: Forcing the logical/boolean data type on a selected set of
###   columns of a data.table object
### Aliases: asLogicalDT

### ** Examples

library(data.table)
inputDT <- as.data.table(data.frame(x = seq(1, 20, 2), y = LETTERS[1:10]))

## No test: 
asLogicalDT(inputDT)
## End(No test)
asLogicalDT(inputDT, c('x', 'y'))

# First looking at the result, followed by testing if the transformation worked!

inputDT
isLogicalDT(inputDT, c('x', 'y'))

# Notice the 'funny' side effect for the 'F' character value of column y...
# This behavior is also observed for the as.logical() base R function.



