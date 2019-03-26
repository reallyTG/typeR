library(R2DT)


### Name: extractRefLevelDT
### Title: Extracting the reference level of all or a selected set of the
###   factor columns of a data.table object
### Aliases: extractRefLevelDT

### ** Examples

library(data.table)
inputDT <- as.data.table(data.frame(x = LETTERS[11:20], y = LETTERS[1:10]))

extractRefLevelDT(inputDT)
## No test: 
extractRefLevelDT(inputDT, c('x', 'y'))
extractRefLevelDT(inputDT, c('x', 'y1'))
## End(No test)

inputDT <- as.data.table(data.frame(x = seq(1, 20, 2), y = LETTERS[1:10]))
extractRefLevelDT(inputDT)

inputDT <- as.data.table(data.frame(x = seq(1, 20, 2), y = seq(2, 21, 2)))
extractRefLevelDT(inputDT)
## No test: 
extractRefLevelDT(inputDT, c('x', 'y'))
## End(No test)



