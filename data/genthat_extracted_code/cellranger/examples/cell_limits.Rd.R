library(cellranger)


### Name: cell_limits
### Title: Create a cell_limits object
### Aliases: as.cell_limits as.cell_limits.NULL as.cell_limits.cell_limits
###   as.cell_limits.character cell_limits dim.cell_limits

### ** Examples

cell_limits(c(1, 3), c(1, 5))
cell_limits(c(NA, 7), c(3, NA))
cell_limits(c(NA, 7))
cell_limits(lr = c(3, 7))

cell_limits(c(1, 3), c(1, 5), "Sheet1")
cell_limits(c(1, 3), c(1, 5), "Spaces are evil")

dim(as.cell_limits("A1:F10"))

as.cell_limits("A1")
as.cell_limits("$Q$24")
as.cell_limits("A1:D8")
as.cell_limits("R5C11")
as.cell_limits("R2C3:R6C9")
as.cell_limits("Sheet1!R2C3:R6C9")
as.cell_limits("'Spaces are evil'!R2C3:R6C9")

## Not run: 
##D ## explicitly mixed A1 references won't work
##D as.cell_limits("A$2")
##D ## mixed or relative R1C1 references won't work
##D as.cell_limits("RC[4]")
## End(Not run)



