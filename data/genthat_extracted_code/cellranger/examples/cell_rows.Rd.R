library(cellranger)


### Name: cell_rows
### Title: Specify cell limits only for rows
### Aliases: cell_rows

### ** Examples

cell_rows(c(NA, 3))
cell_rows(c(7, NA))
cell_rows(4:16)
cell_rows(c(3, NA, 10))

dim(cell_rows(1:5))




