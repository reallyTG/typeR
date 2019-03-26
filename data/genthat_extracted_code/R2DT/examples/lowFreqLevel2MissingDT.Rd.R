library(R2DT)


### Name: lowFreqLevel2MissingDT
### Title: Transform levels of all the factor columns of a data.table
###   object to missing if too little observations pertain to a given level
###   of it.
### Aliases: lowFreqLevel2MissingDT

### ** Examples

library(data.table)
inputDT <- as.data.table(data.frame(x = seq(1, 20, 2), y = LETTERS[1:10]))
levels(inputDT$y)
lowFreqLevel2MissingDT(inputDT, 2)
levels(inputDT$y)

inputDT <- as.data.table(data.frame(x = seq(1, 40, 2),
y = c(LETTERS[1:10], LETTERS[1:10])))
levels(inputDT$y)
lowFreqLevel2MissingDT(inputDT, 1)
levels(inputDT$y)



