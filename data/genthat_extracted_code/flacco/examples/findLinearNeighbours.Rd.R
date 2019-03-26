library(flacco)


### Name: findLinearNeighbours
### Title: Find Neighbouring Cells
### Aliases: findLinearNeighbours

### ** Examples

cell.ids = c(5, 84, 17, 23)
blocks = c(5, 4, 7)

# (1) Considering diagonal neighbours as well:
findLinearNeighbours(cell.ids = cell.ids, blocks = blocks, diag = TRUE)

# (2) Only consider neighbours which are parellel to the axes:
findLinearNeighbours(cell.ids = cell.ids, blocks = blocks)




