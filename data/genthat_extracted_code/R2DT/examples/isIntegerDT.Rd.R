library(R2DT)


### Name: isIntegerDT
### Title: Testing if a set of columns of a data.table object corresponds
###   to the integer data type
### Aliases: isIntegerDT

### ** Examples

library(data.table)
inputDT <- as.data.table(data.frame(x = seq(1L, 20L, 2L), y = LETTERS[1:10]))

isIntegerDT(inputDT)
isIntegerDT(inputDT, c('x', 'y'))
isIntegerDT(inputDT, returnNames = TRUE)

isIntegerDT(inputDT, 'x')
## No test: 
isIntegerDT(inputDT, c('x', 'y1'))
## End(No test)



