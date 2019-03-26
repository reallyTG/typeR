library(R2DT)


### Name: asFactorDT
### Title: Forcing the character/string data type on a selected set of
###   columns of a data.table object
### Aliases: asFactorDT

### ** Examples

library(data.table)
inputDT <- as.data.table(data.frame(x = seq(1, 20, 2), y = LETTERS[1:10]))

## No test: 
asCharacterDT(inputDT)
## End(No test)
asCharacterDT(inputDT, c('x', 'y'))

# First looking at the result, followed by testing if the transformation worked!

inputDT
isCharacterDT(inputDT, c('x', 'y'))
isFactorDT(inputDT, c('x', 'y'))



