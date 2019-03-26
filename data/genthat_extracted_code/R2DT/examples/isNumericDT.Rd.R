library(R2DT)


### Name: isNumericDT
### Title: Testing if a set of columns of a data.table object corresponds
###   to the numeric data type
### Aliases: isNumericDT

### ** Examples

library(data.table)
inputDT <- as.data.table(data.frame(x = seq(1, 20, 2), y = LETTERS[1:10]))

isNumericDT(inputDT)
isNumericDT(inputDT, c('x', 'y'))
isNumericDT(inputDT, returnNames = TRUE)

isNumericDT(inputDT, 'x')
## No test: 
isNumericDT(inputDT, c('x', 'y1'))
## End(No test)



