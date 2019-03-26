library(basictabler)


### Name: TableCell
### Title: A class that represents a cell in a table
### Aliases: TableCell
### Keywords: datasets

### ** Examples

# This class should only be created by using the functions in the table.
# It is not intended to be created by users outside of the table.
library(basictabler)
tbl <- qtbl(data.frame(a=1:2, b=3:4))
cell1 <- tbl$cells$setCell(r=4, c=1, cellType="cell", rawValue=5)
cell2 <- tbl$cells$setCell(r=4, c=2, cellType="cell", rawValue=6)
tbl$renderTable()



