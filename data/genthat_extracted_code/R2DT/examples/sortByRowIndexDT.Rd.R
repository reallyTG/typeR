library(R2DT)


### Name: sortByRowIndexDT
### Title: Order the rows of a data.table object by index
### Aliases: sortByRowIndexDT

### ** Examples

library(data.table)
inputDT <- as.data.table(data.frame(x = 10:1, y = LETTERS[1:10]))
inputDT
sortByRowIndexDT(inputDT, 10:1)
inputDT



