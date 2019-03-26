library(basictabler)


### Name: TableCells
### Title: A class that contains the cells from a table.
### Aliases: TableCells
### Keywords: datasets

### ** Examples

# This class should only be created by the table.
# It is not intended to be created outside of the table.
library(basictabler)
tbl <- qtbl(data.frame(a=1:2, b=3:4))
cells <- tbl$cells
cells$setCell(r=4, c=1, cellType="cell", rawValue=5)
cells$setCell(r=4, c=2, cellType="cell", rawValue=6)
tbl$renderTable()



