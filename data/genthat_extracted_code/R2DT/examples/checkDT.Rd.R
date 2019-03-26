library(R2DT)


### Name: checkDT
### Title: Checking if an object is a data.table object and (optional)
###   testing if some column names are valid for it
### Aliases: checkDT

### ** Examples

library(data.table)
inputDT <- as.data.table(data.frame(x = seq(1, 20, 2), y = LETTERS[1:10]))

checkDT(inputDT)
checkDT(inputDT, c('x', 'y'))

## No test: 
checkDT(inputDT, c('x', 'y1'))
checkDT(inputDT, c('x', 'y1', 'z1'))
checkDT(inputDT, c('x1', 'y1', 'z1'))
## End(No test)



