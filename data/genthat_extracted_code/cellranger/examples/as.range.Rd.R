library(cellranger)


### Name: as.range
### Title: Convert a cell_limits object to a cell range
### Aliases: as.range

### ** Examples

rgCL <- cell_limits(ul = c(1, 2), lr = c(7, 6))
as.range(rgCL)
as.range(rgCL, fo = "A1")

rgCL_ws <- cell_limits(ul = c(1, 2), lr = c(7, 6), sheet = "A Sheet")
as.range(rgCL_ws)
as.range(rgCL_ws, fo = "A1")



