library(R2DT)


### Name: extractLevelDT
### Title: Extracting the levels of all or a selected set of the factor
###   columns of a data.table object
### Aliases: extractLevelDT

### ** Examples

library(data.table)
inputDT <- as.data.table(data.frame(x = LETTERS[11:20], y = LETTERS[1:10]))

extractLevelDT(inputDT)
extractLevelDT(inputDT, c('x', 'y'))
## No test: 
extractLevelDT(inputDT, c('x', 'y1'))
## End(No test)

inputDT <- as.data.table(data.frame(x = seq(1, 20, 2), y = LETTERS[1:10]))
extractLevelDT(inputDT)

inputDT <- as.data.table(data.frame(x = seq(1, 20, 2), y = seq(2, 21, 2)))
extractLevelDT(inputDT)
## No test: 
extractLevelDT(inputDT, c('x', 'y'))
## End(No test)



