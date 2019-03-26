library(R2DT)


### Name: isFactorDT
### Title: Testing if a set of columns of a data.table object corresponds
###   to the factor data type
### Aliases: isFactorDT

### ** Examples

library(data.table)
inputDT <- as.data.table(data.frame(x = seq(1, 20, 2), y = LETTERS[1:10]))

isFactorDT(inputDT)
isFactorDT(inputDT, c('x', 'y'))
isFactorDT(inputDT, returnNames = TRUE)

isFactorDT(inputDT, 'y')
## No test: 
isFactorDT(inputDT, c('x', 'y1'))
## End(No test)



