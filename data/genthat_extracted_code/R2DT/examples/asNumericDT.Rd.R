library(R2DT)


### Name: asNumericDT
### Title: Forcing the numeric data type on a selected set of columns of a
###   data.table object
### Aliases: asNumericDT

### ** Examples

library(data.table)
inputDT <- as.data.table(data.frame(x = seq(1, 20, 2), y = LETTERS[1:10]))

## No test: 
asNumericDT(inputDT)
## End(No test)
asNumericDT(inputDT, c('x', 'y'))

# First looking at the result, followed by testing if the transformation worked!

inputDT
isNumericDT(inputDT, c('x', 'y'))
isIntegerDT(inputDT, c('x', 'y'))



