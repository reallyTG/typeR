library(R2DT)


### Name: setRefLevelDT
### Title: Setting the reference level of all or a selected set of the
###   factor columns of a data.table object
### Aliases: setRefLevelDT

### ** Examples

library(data.table)
inputDT <- as.data.table(data.frame(x = LETTERS[11:20], y = LETTERS[1:10]))

## No test: 
setRefLevelDT(inputDT)
## End(No test)

levels(inputDT$x)[1]
levels(inputDT$y)[1]
setRefLevelDT(inputDT, c('x', 'y'), c('L', 'C'))
levels(inputDT$x)[1]
levels(inputDT$y)[1]

## No test: 
setRefLevelDT(inputDT, c('x', 'y'), c('bla', 'bla'))
## End(No test)

inputDT <- as.data.table(data.frame(x = seq(1, 20, 2), y = LETTERS[1:10]))
levels(inputDT$y)[1]
setRefLevelDT(inputDT, 'y', 'E')
levels(inputDT$y)[1]



