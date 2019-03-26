library(R2DT)


### Name: isLogicalDT
### Title: Testing if a set of columns of a data.table object corresponds
###   to the logical/boolean data type
### Aliases: isLogicalDT

### ** Examples

library(data.table)
inputDT <- as.data.table(data.frame(x = rep(c(TRUE, FALSE), 5), y = LETTERS[1:10]))

isLogicalDT(inputDT)
isLogicalDT(inputDT, c('x', 'y'))
isLogicalDT(inputDT, returnNames = TRUE)

isLogicalDT(inputDT, 'x')
## No test: 
isLogicalDT(inputDT, c('x', 'y1'))
## End(No test)



