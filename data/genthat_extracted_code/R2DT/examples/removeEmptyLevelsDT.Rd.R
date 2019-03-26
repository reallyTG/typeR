library(R2DT)


### Name: removeEmptyLevelsDT
### Title: Remove empty levels from all the factor columns of a data.table
###   object
### Aliases: removeEmptyLevelsDT

### ** Examples

library(data.table)
inputDT <- as.data.table(data.frame(x = seq(1, 20, 2), y = LETTERS[1:10]))
levels(inputDT$y)
removeEmptyLevelsDT(inputDT)
levels(inputDT$y)
removeEmptyLevelsDT(inputDT[x < 10])
levels(inputDT$y)

# You need to define a new data.table object
# in order to make the 'removeEmptyLevelsDT' function work.
reducedDT <- inputDT[x < 10]
levels(reducedDT$y)
removeEmptyLevelsDT(reducedDT)
levels(reducedDT$y)



