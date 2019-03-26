library(cellranger)


### Name: cell_cols
### Title: Specify cell limits only for columns
### Aliases: cell_cols

### ** Examples

cell_cols(c(NA, 3))
cell_cols(c(7, NA))
cell_cols(4:16)
cell_cols(c(3, NA, 10))

cell_cols("C:G")
cell_cols(c("B", NA))
cell_cols(LETTERS)




