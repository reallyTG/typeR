library(R2DT)


### Name: asIntegerDT
### Title: Forcing the integer data type on a selected set of columns of a
###   data.table object
### Aliases: asIntegerDT

### ** Examples

library(data.table)
inputDT <- as.data.table(data.frame(x = seq(1, 20, 2), y = LETTERS[1:10]))

## No test: 
asIntegerDT(inputDT)
## End(No test)
asIntegerDT(inputDT, c('x', 'y'))

# First looking at the result, followed by testing if the transformation worked!

inputDT
isIntegerDT(inputDT, c('x', 'y'))

# Note the following behavior that also holds for the as.integer() base R function.
isNumericDT(inputDT, c('x', 'y'))



